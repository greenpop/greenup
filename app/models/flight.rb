class Flight < ActiveRecord::Base
  def self.select
    all.map { |f| [f.origin, f.id] }
  end

  def calculate_carbon
    self.distance * self.carbon_per_km
  end
end