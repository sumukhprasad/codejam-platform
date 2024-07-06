class ChangeIntegerLimitInInstitutions < ActiveRecord::Migration[7.1]
	def change
		change_column :institutions, :phone_number, :integer, limit: 8
	end
end
