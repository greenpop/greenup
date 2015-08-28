class AddContributionToEvent < ActiveRecord::Migration
  def change
    add_column :events, :contribution, :string
  end
end
