class TripAdvisor
	include HTTParty
	base_uri 'api.tripadvisor.com'

	LOCATION_IDS = { new_orleans: '60864', italy: '187768', rome: '187791' }

	def initialize
		@options = { "User-Agent" => "Travel_App", "X-TripAdvisor-API-Key" => ENV["TRIP_ADVISOR_API_KEY"] }
	end

	def attractions(location_name)
		location_id = LOCATION_IDS[location_name.parameterize.underscore.to_sym]
		JSON.parse(self.class.get("/api/partner/2.0/location/#{location_id}/attractions?#{@key}", headers: @options).body)["data"]
	end
end

