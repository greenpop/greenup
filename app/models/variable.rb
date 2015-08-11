class Variable < ActiveRecord::Base
  def self.get(name) 
    find_by(name: "bus_carbon_per_km").value
  end
end