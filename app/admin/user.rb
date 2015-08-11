ActiveAdmin.register User do
  config.sort_order = 'created_at_asc'

  filter :name_or_surname_cont, label: 'Name / Surname'
  filter :email
  filter :event
  
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

    column "Signed Up", sortable: :created_at do |u|
      u.created_at.strftime("%B %e, %Y, %H:%M")
    end
    column :name
    column :surname
    column :email
    column "Distance Travelled (km)" do |user|
      user.total(:km_travelled)
    end
    column "Event", :sortable do |user|
      user.trips[0].event.name
    end
    column "Car CO" do |user|
      total_car_carbon << user.trips[0][:car_carbon]
      user.trips[0][:car_carbon]
    end
    column "Plane CO" do |user|
      total_flight_carbon << user.trips[0][:flight_carbon]
      user.trips[0][:flight_carbon]  
    end
    column "Train CO" do |user|
      total_train_carbon << user.trips[0][:train_carbon]
      user.trips[0][:train_carbon]
    end
    column "Bus CO" do |user|
      total_bus_carbon << user.trips[0][:bus_carbon]
      user.trips[0][:bus_carbon]
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
      "Total Carbon Generated: " + total_carbon.sum.to_s + " kg"
    end

    div :class => "Row2" do |user|
      "Total Funds Raised: R" + total_donation.sum.to_s
    end

  end

  # index row_class: ->elem { 'active' if elem.active? } do
  #   array = [1,2,3,4,5,6,7,8,9,0]
  #   array.each do |number|
  #     number
  #   end
  # end

  csv do
  total_carbon = []
  total_donation = []
  total_car_carbon = []
  total_flight_carbon = []
  total_bus_carbon = []
  total_train_carbon = []

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
      user.total(:carbon)
    end
    column "Donation (ZAR)" do |user|
      user.total_donation
    end
    column "Pledges" do |user|
      user.pledges_summary
    end
    column "Total Carbon" do |user|
      total_carbon.sum.to_s
    end
    column "Total Donation" do |user|
      total_donation.sum.to_s 
    end

  end

  
end
