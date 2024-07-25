include Pagy::Backend

class LeaderboardController < ApplicationController
	def index
		@pagy, @scores = if !@scores.blank? then pagy_array(Rails.cache.fetch('leaderboard')) else nil
	end
end
