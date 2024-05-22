class QuestionsController < ApplicationController
	before_action :authenticate_student!
	
	def show
		@question = Question.find_by(:slug => params[:slug])
	end
	
	def input
		@question = Question.find_by(:slug => params[:question_slug])
		@input = @question.testcases.find_by(:testcase_number => current_student.testcase_number).input.download
		send_data @input, filename: "input.txt", disposition: "inline", type: "text/plain"
	end
end
