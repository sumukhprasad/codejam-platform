class SubmissionsController < ApplicationController
	before_action :authenticate_student!

	def index
		@question = Question.find_by(:slug => params[:question_slug])
		@submissions = @question.submissions.where(:student_id => current_student.id)
	end

	def create
		@submission = Submission.new()
		@question = Question.find_by(:id => params[:question])
		@submission.student = current_student
		@submission.question = @question
		@submission.result = params[:result]
		@submission.save!
		redirect_to question_submissions_path(@question.slug)
	end
end
