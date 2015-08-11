class AddEventIdToPledgeAndTree < ActiveRecord::Migration
  def change
  	add_column :trips, :km_travelled, :integer
  	add_column :trees, :event_id, :integer
  	add_column :pledges, :event_id, :integer
  end
end
