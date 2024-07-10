class CountdownController < ApplicationController
	layout false
	
	def index
		@config = ContestConfiguration.where(active: true).first
	end
end
