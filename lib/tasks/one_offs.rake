require 'progress_bar'

desc "one off data cleanup tasks"

  namespace :destination_name do 
    task :copy_english_name_to_native_lang_name => :environment do 
      
      puts "\n---------------------------------------------------------"
      puts "Starting destination_name:copy_english_name_to_native_lang_name at #{DateTime.now}"

      destinations = Destination.where(native_language_name: nil)
      total_records = destinations.count
      progress_bar = ProgressBar.new(total_records)

      destinations.each do |d|
        d.native_language_name = d.english_name
        d.save!

        progress_bar.increment!
      end

      puts "\n Updated #{total_records} records."
      puts "Completed destination_name:copy_english_name_to_native_lang_name"
      puts "---------------------------------------------------------\n"
    end
  end