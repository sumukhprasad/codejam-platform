class InstitutionsController < ApplicationController
	before_action :authenticate_institution!
	
	def index
		@institution = current_institution
	end
	
	def information
		@institution = current_institution
	end

	def registrants
		@institution = current_institution
	end
end
