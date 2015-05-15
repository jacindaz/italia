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

	def self.scrape_new_orleans_top_30_attractions
		encode_url = URI::encode("http://www.tripadvisor.com/Attractions-g60864-Activities-New_Orleans_Louisiana.html")
		page = Nokogiri::HTML(open("#{encode_url}"))
		attractions_div = page.xpath('//div[contains(@class, "property_title")]')

		attractions_link_text = []
		attractions_div.each do |attraction|
			attractions_link_text << { 
					link: "http://www.tripadvisor.com" + "#{attraction.children[1].attributes["href"].value}", 
					text: attraction.children[1].children[0].text 
				}
		end

	end
end

