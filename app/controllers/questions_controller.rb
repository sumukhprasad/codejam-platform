class QuestionsController < ApplicationController
	before_action :authenticate_student!
	
	def show
		@question = Question.find_by(:slug => params[:slug])
	end
end
