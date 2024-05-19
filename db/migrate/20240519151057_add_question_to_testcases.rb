class AddQuestionToTestcases < ActiveRecord::Migration[7.1]
	def change
		add_reference :testcases, :question, null: false, foreign_key: true
	end
end
