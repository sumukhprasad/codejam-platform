class Submission < ApplicationRecord
	belongs_to :question
	belongs_to :student
	validates :result, presence: true
	validates :is_correct, inclusion: { in: [ true, false ] }
	validates :gold_star, inclusion: { in: [ true, false ] }
	
	before_validation(on: :create) do
		verify_if_correct
		assign_gold_star
		puts self
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
	
	def assign_gold_star
		if is_correct && question.submissions.where(is_correct: true).count == 0
			self.gold_star = true
		else
			self.gold_star = false
		end
	end
end
