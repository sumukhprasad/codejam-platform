class AddScoreToQuestions < ActiveRecord::Migration[7.1]
	def change
		add_column :questions, :score, :integer
	end
end
