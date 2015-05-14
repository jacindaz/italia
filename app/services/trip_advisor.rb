class TripAdvisor
	include HTTParty
	base_uri 'api.tripadvisor.com'

	def initialize
		@options = { "User-Agent" => "Travel_App", "X-TripAdvisor-API-Key" => ENV["TRIP_ADVISOR_API_KEY"] }
	end

	def attractions
		self.class.get("/api/partner/2.0/location/60864/attractions?#{@key}", headers: @options)
	end
end
