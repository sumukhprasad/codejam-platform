class AddDefaultValuesToStarsInSubmissions < ActiveRecord::Migration[6.0]
	def change
		change_column_default :submissions, :gold_star, from: nil, to: false
		change_column_default :submissions, :silver_star, from: nil, to: false
		change_column_default :submissions, :bronze_star, from: nil, to: false
	end
end