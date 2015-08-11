class Car < ActiveRecord::Base
  def self.select
    all.map { |f| [f.size, f.id] }
  end

  def calculate_carbon(km, people)
    km.to_f * self.carbon_per_km / people.to_i
  end
end