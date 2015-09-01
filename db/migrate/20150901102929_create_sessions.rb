class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :event_name
      t.integer :user_id
      t.integer :km_travelled
      t.integer :car_carbon
      t.integer :bus_carbon
      t.integer :plane_carbon
      t.integer :train_carbon
      t.integer :total_carbon
      t.float :rand_given
      t.float :dollar_amount
      t.string :pledge

      t.timestamps
    end
  end
end
