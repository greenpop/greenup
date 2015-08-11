class AddBackgroundToEvents < ActiveRecord::Migration
  def self.up
    add_attachment :events, :background
  end

  def self.down
    remove_attachment :events, :background
  end
end
