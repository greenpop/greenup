class AddFlightCarbonToTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :flight_carbon, :integer
  end
end
