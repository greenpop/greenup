class Event < ActiveRecord::Base
  has_many :trips
  has_many :pledges
  has_many :users, :foreign_key => 'event_id'

	has_attached_file :background, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :background, :content_type => /\Aimage\/.*\Z/

  def total(carbon_or_km)
    self.trips.pluck(carbon_or_km).inject{ |sum,x| sum + x }
  end
end
