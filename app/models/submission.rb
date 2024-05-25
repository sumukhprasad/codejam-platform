class Submission < ApplicationRecord
	include RansackSearchable
	
	belongs_to :question
	belongs_to :student
	validates :result, presence: true
	validates :is_correct, inclusion: { in: [ true, false ] }
	validates :gold_star, inclusion: { in: [ true, false ] }
	validates :silver_star, inclusion: { in: [ true, false ] }
	validates :bronze_star, inclusion: { in: [ true, false ] }
	
	before_validation(on: :create) do
		verify_if_correct
		assign_stars
	end
	
	private
	
	def verify_if_correct
		expected_output = question.testcases.find_by(:testcase_number => student.testcase_number).output.download
		
		if result == expected_output
			self.is_correct = true
		else
			self.is_correct = false
		end
	end
	
	def assign_stars
		correct_submissions_count = question.submissions.where(is_correct: true).count
		if is_correct
			if correct_submissions_count == 0
				self.gold_star = true
			elsif correct_submissions_count.between?(1, 5)
				self.silver_star = true
			elsif correct_submissions_count.between?(6, 15)
				self.bronze_star = true
			end
		end
	end
end
