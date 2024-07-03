include Pagy::Backend

class LeaderboardController < ApplicationController
	def index
		@pagy, @scores = pagy_array(Rails.cache.fetch('leaderboard'))
	end
end
