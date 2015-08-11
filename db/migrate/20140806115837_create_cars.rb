class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :size
      t.float :carbon_per_km
    end
  end
end
