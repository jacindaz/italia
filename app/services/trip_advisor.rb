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

	def attractions_by_id
		# http://api.tripadvisor.com/api//partner/2.0/location/210266,638047/attractions?key=5e21e5e014b841b392276ec53ae450c5
		attractions_id_array_batches = self.attractions_batches_of_10
		response_batches = []

		attractions_batches_of_10.each do |id_batch|
			binding.pry
			id_batch = id_batch.join(",")
			response_batches << JSON.parse(self.class.get("/api/partner/2.0/location/#{id_batch}/attractions?", headers: @options).body)["data"]
		end
		response_batches.flatten.length
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

		attractions_link_text
	end
end

