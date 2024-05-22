class StudentsController < ApplicationController
	before_action :authenticate_student!
	
	def index
		@student = current_student
		@questions = Question.all
	end
end
