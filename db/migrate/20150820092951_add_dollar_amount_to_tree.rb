class AddDollarAmountToTree < ActiveRecord::Migration
  def change
    add_column :trees, :dollar_amount, :float
  end
end
