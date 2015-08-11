class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :carbon

      t.timestamps
    end
  end
end
