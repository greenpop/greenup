ActiveAdmin.register User do
  config.sort_order = 'created_at_asc'

  filter :name_or_surname_cont, label: 'Name / Surname'
  filter :email
  filter :events, collection: -> {Event.all}, label: 'Events'
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  
  index do

    total_carbon = []
    total_donation = []
    total_car_carbon = []
    total_flight_carbon = []
    total_bus_carbon = []
    total_train_carbon = []
    total_distance = []

    column "Signed Up", sortable: :created_at do |u|
      u.created_at.strftime("%B %e, %Y, %H:%M")
    end

    column :name
    column :surname
    column :email

    column "Distance Travelled (km)" do |user|
      user.trips.each do |trip|
        if trip.event ==  :event
          total_distance << trip.km_travelled
        end
      end
      user.trips.collect(&:km_travelled).join(', ')
    end

    column "Events", :sortable do |user|
      user.events.collect(&:name).join(', ')
    end

    column "Car CO" do |user|
      if user.trips != nil
        total_car_carbon << user.trips[0][:car_carbon]
        user.trips.collect(&:car_carbon).join(', ')
      end
    end

    column "Plane CO" do |user|
      if user.trips != nil
        total_flight_carbon << user.trips[0][:flight_carbon]
        user.trips.collect(&:flight_carbon).join(', ')
      end
    end

    column "Train CO" do |user|
      if user.trips != nil
        total_train_carbon << user.trips[0][:train_carbon]
        user.trips.collect(&:train_carbon).join(', ')
      end
    end

    column "Bus CO" do |user|
      if user.trips != nil
        total_bus_carbon << user.trips[0][:bus_carbon]
        user.trips.collect(&:bus_carbon).join(', ')
      end
    end

    column "Total Carbon (kg)" do |user|
      total_carbon << user.total(:carbon)
      user.total(:carbon)
    end

    column "Donation (ZAR)" do |user|
      total_donation << user.total_donation
      user.total_donation
    end

    column "Pledges" do |user|
      user.pledges_summary
    end

    div :class => "Row" do |user| 
      "Total Carbon Generated: " + total_carbon.compact.sum.to_s + " kg"
    end

    div :class => "Row2" do |user|
      "Total Funds Raised: R" + total_donation.compact.sum.to_s
    end

    div :class => "Row3" do |user|
      "Total distance travelled: " + total_distance.compact.sum.to_s + "km"
    end
  end

  # index row_class: ->elem { 'active' if elem.active? } do
  #   array = [1,2,3,4,5,6,7,8,9,0]
  #   array.each do |number|
  #     number
  #   end
  # end

  csv force_quotes: true, col_sep: ';' do
    total_carbon = []
    total_donation = []
    total_car_carbon = []
    total_flight_carbon = []
    total_bus_carbon = []
    total_train_carbon = []
    total_distance = []

    column :name
    column :surname
    column :email

    column "Distance Travelled (km)" do |user|
      user.total(:km_travelled)
    end

    column "Event" do |user|
      user.trips[0].event.name
    end

    column "Car CO" do |user|
      user.trips[0][:car_carbon]
    end

    column "Plane CO" do |user|
      user.trips[0][:flight_carbon]  
    end

    column "Train CO" do |user|
      user.trips[0][:train_carbon]
    end

    column "Bus CO" do |user|
      user.trips[0][:bus_carbon]
    end

    column "Carbon (kg)" do |user|
      total_carbon << user.total(:carbon)
      user.total(:carbon)
    end

    column "Donation (ZAR)" do |user|
      total_donation << user.total_donation
      user.total_donation
    end

    column "Pledges" do |user|
      user.pledges_summary
    end

    #NOTE this prints a running total.  is there a "div" equivalent in csv? 
    column "Running Total Carbon" do |user|
      total_carbon.compact.sum.to_s
    end

    column "Running Total Donation" do |user|
      total_donation.compact.sum.to_s 
    end

  end
  
end
