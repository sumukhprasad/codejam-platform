class SubmissionsController < ApplicationController
	before_action :authenticate_student!

	def index
		@question = Question.find_by(:slug => params[:question_slug])
		@submissions = @question.submissions.where(:student_id => current_student.id)
	end

	def create
		@config = ContestConfiguration.where(active: true).first
		@question = Question.find_by(:id => params[:question])
		if @config != nil && @config.start_time < DateTime.now && @config.end_time > DateTime.now
			@submission = Submission.new()
			@submission.student = current_student
			@submission.question = @question
			@submission.result = params[:result]
			@submission.save!
			redirect_to question_submissions_path(@question.slug)
		else
			flash[:error] = "You cannot make any new submissions once CodeJam has ended."
			redirect_to question_submissions_path(@question.slug)
		end
	end
end
