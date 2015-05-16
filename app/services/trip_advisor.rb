# require "activerecord-import/base"
# ActiveRecord::Import.require_adapter('mysql2')

class TripAdvisor
	include HTTParty
	base_uri 'api.tripadvisor.com'

	LOCATION_IDS = { new_orleans: '60864', italy: '187768', rome: '187791' }

	def initialize(limit=nil, offset=nil)
		@options = { 
								"User-Agent" => "Travel_App", 
								"X-TripAdvisor-API-Key" => ENV["TRIP_ADVISOR_API_KEY"]
							}
		@limit = limit
		@offset = offset
	end

	def attractions(location_name)
		location_id = LOCATION_IDS[location_name.parameterize.underscore.to_sym]
		JSON.parse(self.class.get("/api/partner/2.0/location/#{location_id}/attractions?limit=#{@limit}&offset=#{@offset}", headers: @options).body)["data"]
	end

	def one_attraction(attraction_id)
		# gives you a little more info about attraction
		# gives you 5 reviews
		JSON.parse(self.class.get("http://api.tripadvisor.com/api/partner/2.0/location/#{attraction_id}", headers: @options).body)
	end

	def save_attractions_and_addresses(results)
		results.each do |attraction| 
			save_destination(attraction)
		end
	end

	def save_destination(destination_info)
		destination_hash = { english_name: destination_info["name"],
				category: Destination.category_matching(destination_info["subcategory"][0]["name"]),
				destination_website: destination_info["web_url"],
				cost: 0 }
		destination = Destination.new(destination_hash)

		if destination.valid?
			ActiveRecord::Base.transaction do 
				Destination.find_or_create_by(destination_hash)
				destination_saved = Destination.where(english_name: destination.english_name).first
				save_address(destination_info["address_obj"].merge({destination_id: destination_saved.id}))

				puts "==================="
				puts "Destination saved: #{destination.english_name}, #{destination.category}"
				puts "==================="
			end
		else
			puts "==================="
			puts "Destination not saved: #{destination.english_name}, #{destination.category}"
			puts "==================="
		end

	end

	def save_address(address_info)
			# instead of using ActiveRecord here, could use SQL to make faster
			street_address1 = address_info["street1"].to_s
			street_address2 = address_info["street2"].to_s

		address = Address.new(
			street_address: street_address1 + street_address2,
			phone_number: '',
			zip: address_info["postalcode"],
			city_id: City.where(english_name: 'New Orleans').first.id.to_i
			)

		if address.valid?
			address.save!
			puts "==================="
			puts "Address saved: #{address.street_address}, #{address.zip}"
			puts "==================="
		else
			puts "==================="
			puts "Address not saved: #{address.street_address}, #{address.zip}"
			puts "==================="
		end
	end

	def attractions_by_id
		# http://api.tripadvisor.com/api//partner/2.0/location/210266,638047/attractions?key=5e21e5e014b841b392276ec53ae450c5
		attractions_id_array_batches = self.attractions_batches_of_10
		response_batches = []

		attractions_batches_of_10.each do |id_batch|
			id_batch = id_batch.join(",")
			response_batches << JSON.parse(self.class.get("/api/partner/2.0/location/#{id_batch}/attractions?", headers: @options).body)["data"]
		end
		response_batches.flatten
	end

	def attractions_batches_of_10
		scrape = TripAdvisor.scrape_new_orleans_attractions_no_tours
		ids = scrape.map{ |a| a[:id] }.reject(&:nil?).uniq
		ids.each_slice(10).to_a
	end

	def self.scrape_new_orleans_attractions_no_tours
		encode_url = URI::encode("http://www.tripadvisor.com/Attractions-g60864-Activities-New_Orleans_Louisiana.html")
		page = Nokogiri::HTML(open("#{encode_url}"))
		attractions_div = page.xpath('//div[contains(@class, "property_title")]')

		attractions_link_text = []
		attractions_div.each do |attraction|
			link = "http://www.tripadvisor.com" + "#{attraction.children[1].attributes["href"].value}"
			split_destination_link_string = link.split("-d")[1]
			attractions_link_text << { 
					link: link, 
					text: attraction.children[1].children[0].text,
					id: (split_destination_link_string.split("-")[0].to_i if split_destination_link_string)
				}
		end
		puts "\n================"
		puts "#{attractions_link_text}"
		puts "================\n"
	
		attractions_link_text
	end
end



