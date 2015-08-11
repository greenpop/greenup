class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.integer :user_id
      t.integer :rand_given

      t.timestamps
    end
  end
end
