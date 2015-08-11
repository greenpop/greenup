class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :origin
      t.integer :distance
      t.float :carbon_per_km
    end
  end
end
