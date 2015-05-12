class TripAdvisor
	include HTTParty
	base_uri 'http://api.tripadvisor.com/api//partner/2.0/location/60864'

	def initialize
		@key = ENV["TRIP_ADVISOR_API_KEY"]
	end

	def attractions
		self.class.get("/attractions?#{@key}")
	end
end