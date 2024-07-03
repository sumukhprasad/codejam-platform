class QuestionsController < ApplicationController
	before_action :authenticate_student!
	
	def show
		@config = ContestConfiguration.where(active: true).first
		@question = Question.find_by(:slug => params[:slug])
		@submissions_allowed = @question.submissions.where(:student_id => current_student.id, :is_correct => true).empty?
	end
	
	def input
		@question = Question.find_by(:slug => params[:question_slug])
		@input = @question.testcases.find_by(:testcase_number => current_student.testcase_number).input.download
		send_data @input, filename: "input.txt", disposition: "inline", type: "text/plain"
	end
end
