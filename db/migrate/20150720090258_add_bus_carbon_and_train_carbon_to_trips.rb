class AddBusCarbonAndTrainCarbonToTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :bus_carbon, :integer
  	add_column :trips, :train_carbon, :integer
  end
end
