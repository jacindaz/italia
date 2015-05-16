require "trip_advisor"

desc "Call TripAdvisor API to get New Orleans destinations"
  namespace :trip_advisor do 
    task :get_new_orleans_destinations => :environment do 
      ta = TripAdvisor.new
      results = ta.attractions_by_id
      ta.save_attractions_and_addresses(results)
    end
  end