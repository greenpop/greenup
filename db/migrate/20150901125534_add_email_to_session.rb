class AddEmailToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :email, :string
  end
end
