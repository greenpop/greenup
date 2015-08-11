namespace :db do
  desc "Populate the database with data"
  task populate: :environment do
    Event.create do |e|
      e.name = "Rocking the Daisies"
      e.about = "This event rocks!"
      e.start_date = Date.parse("September 2, 2014")
      e.end_date = Date.parse("September 5, 2014")
    end
  end  
end

