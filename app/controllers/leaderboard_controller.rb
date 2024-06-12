class LeaderboardController < ApplicationController
	def index
		@scores = Rails.cache.fetch('leaderboard')
	end
end
