ActiveAdmin.register Session do
	filter :event_name, label: 'Events'

	index do |session|
		total_carbon = []
	    total_donation = []
	    total_car_carbon = []
	    total_flight_carbon = []
	    total_bus_carbon = []
	    total_train_carbon = []
	    total_distance = []

		column "User Email", :email
		column :event_name
        column "Distance Travelled" do |session|
        	total_distance << session.km_travelled
        	session.km_travelled
        end
        column "Total Carbon" do |session|
        	total_carbon << session.total_carbon
        	session.total_carbon
        end
        column "Car CO" do |session|
        	total_car_carbon << session.car_carbon
        	session.car_carbon
        end
        column "Bus CO" do |session|
        	total_bus_carbon << session.bus_carbon
        	session.bus_carbon
        end
        column "Plane CO" do |session|
        	total_flight_carbon << session.plane_carbon
        	session.plane_carbon
        end
        column "Train CO" do |session|
        	total_train_carbon << session.train_carbon
        	session.train_carbon
        end
        column "Rand Amount (ZAR)" do |session|
        	total_donation << session.rand_given
        	session.rand_given
        end
        column :dollar_amount
        column :pledge


	    div :class => "Row" do |user|
	      "Total Funds Raised: R" + total_donation.compact.sum.to_s
	    end

	    div :class => "Row2" do |user|
	      "Total Distance Travelled: " + total_distance.compact.sum.to_s + "km"
	    end
	    div :class => "Row3" do |user| 
	      "Total Carbon Generated: " + total_carbon.compact.sum.to_s + " kg"
	    end
	    div :class => "Row4" do |user| 
	      "Total Car Carbon Generated: " + total_car_carbon.compact.sum.to_s + " kg"
	    end

	    div :class => "Row5" do |user|
	      "Total Plane Carbon Generate: " + total_flight_carbon.compact.sum.to_s + " kg"
	    end

	    div :class => "Row6" do |user|
	      "Total Bus Carbon Generated: " + total_bus_carbon.compact.sum.to_s + "kg"
	    end
	    div :class => "Row7" do |user|
	      "Total Train Carbon Generated: " + total_train_carbon.compact.sum.to_s + "kg"
	    end
    end

	csv force_quotes: true, col_sep: ';' do
	    total_carbon = []
	    total_donation = []
	    total_car_carbon = []
	    total_flight_carbon = []
	    total_bus_carbon = []
	    total_train_carbon = []
	    total_distance = []

		column :email
		column :event_name
        column "Distance Travelled" do |session|
        	total_distance << session.km_travelled
        	session.km_travelled
        end
        column "Total Carbon" do |session|
        	total_carbon << session.total_carbon
        	session.total_carbon
        end
        column "Car CO" do |session|
        	total_car_carbon << session.car_carbon
        	session.car_carbon
        end
        column "Bus CO" do |session|
        	total_bus_carbon << session.bus_carbon
        	session.bus_carbon
        end
        column "Plane CO" do |session|
        	total_flight_carbon << session.plane_carbon
        	session.plane_carbon
        end
        column "Train CO" do |session|
        	total_train_carbon << session.train_carbon
        	session.train_carbon
        end
        column "Rand Amount (ZAR)" do |session|
        	total_donation << session.rand_given
        	session.rand_given
        end
        column :dollar_amount
        column :pledge

        column "Running Total Carbon" do |user|
      		total_carbon.compact.sum.to_s
    	end

	    column "Running Total Donation" do |user|
	      total_donation.compact.sum.to_s 
	    end
	    column "Running Total Distance Travelled" do |user|
	      total_donation.compact.sum.to_s 
	    end
	end
end