class AddUserinfoToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :name, :string
    add_column :sessions, :surname, :string
    add_column :sessions, :first_session, :datetime
  end
end
