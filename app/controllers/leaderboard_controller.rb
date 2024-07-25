include Pagy::Backend

class LeaderboardController < ApplicationController
	def index
		@pagy, @scores = if !Rails.cache.fetch('leaderboard').blank? then pagy_array(Rails.cache.fetch('leaderboard')) else nil end
	end
end
