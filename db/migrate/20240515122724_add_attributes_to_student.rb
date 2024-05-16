class AddAttributesToStudent < ActiveRecord::Migration[7.1]
	def change
		add_column :students, :first_name, :string
		add_column :students, :preferred_first_name, :string
		add_column :students, :middle_name, :string
		add_column :students, :last_name, :string
		add_column :students, :gender, :string
		add_column :students, :date_of_birth, :date
	
		add_reference :students, :institution, null: false, foreign_key: true
	end
end
