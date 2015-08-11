class AddCarCarbonToTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :car_carbon, :integer
  end
end
