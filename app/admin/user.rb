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

    column "Sessions" do |user|
      table_for user.sessions do |session|
        column :event_name
        column :km_travelled
        column :total_carbon
        column :car_carbon
        column :bus_carbon
        column :plane_carbon
        column :train_carbon
        column :rand_given
        column :dollar_amount
        column :pledge
      end
      user.sessions.each do |session|
        total_distance << session.km_travelled
        total_car_carbon << session.car_carbon
        total_flight_carbon << session.plane_carbon
        total_train_carbon << session.train_carbon
        total_bus_carbon << session.bus_carbon
        total_carbon << session.total_carbon
        total_donation << session.rand_given
      end
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
      user.trips.each do |trip|
        if trip.event ==  :event
          total_distance << trip.km_travelled
        end
      end
      user.trips.collect(&:km_travelled).join(', ')
    end

    column "Event" do |user|
      user.events.collect(&:name).join(', ')
    end

    column "Car CO" do |user|
      if user.trips[0] != nil
        user.trips.collect(&:car_carbon).join(', ')
      end
    end

    column "Plane CO" do |user|
      if user.trips[0] != nil
        user.trips.collect(&:flight_carbon).join(', ')  
      end
    end

    column "Train CO" do |user|
      if user.trips[0] != nil
        user.trips.collect(&:train_carbon).join(', ')
      end
    end

    column "Bus CO" do |user|
      if user.trips[0] != nil
        user.trips.collect(&:bus_carbon).join(', ')
      end
    end

    column "Carbon (kg)" do |user|
      total_carbon << user.total(:carbon)
      user.trips.collect(&:carbon).join(', ')
    end

    column "Donation (ZAR)" do |user|
      total_donation << user.total_donation
      user.trees.collect(&:rand_given).join(', ')
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
