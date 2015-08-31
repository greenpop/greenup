# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

flights = [['South Africa', 1000, 0.192],
               ['Southern Africa', 4000, 0.192],
               ['Northern Africa', 8000, 0.226],
               ['Europe', 10000, 0.226],
               ['Australia', 11000, 0.226],
               ['Middle East', 8000, 0.226],
               ['Far East', 13000, 0.226],
               ['North America (East Coast)', 12500, 0.226],
               ['North America (West Coast)', 16000, 0.226],
               ['South America', 8000, 0.226]]

flights.each do |flight|
  Flight.where(origin: flight[0]).first_or_create! do |f|
    f.origin = flight[0]
    f.distance = flight[1]
    f.carbon_per_km = flight[2]
  end
end

cars = [["Small",0.4],["Medium",0.5],["Large",0.6]]

cars.each do |car|
  Car.where(size: car[0]).first_or_create! do |c|
    c.size = car[0]
    c.carbon_per_km = car[1]
  end
end

variables = [["train_carbon_per_km", 0.047], ["bus_carbon_per_km", 0.109]]

variables.each do |variable|
  Variable.where(name: variable[0]).first_or_create! do |v|
    v.name = variable[0]
    v.value = variable[1]
  end
end

AdminUser.create! email: "admin5@example.com", password: "password"