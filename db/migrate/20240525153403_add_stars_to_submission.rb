class AddStarsToSubmission < ActiveRecord::Migration[7.1]
	def change
		add_column :submissions, :silver_star, :boolean
		add_column :submissions, :bronze_star, :boolean
	end
end
