class AddAttributesToInstitution < ActiveRecord::Migration[7.1]
	def change
		add_column :institutions, :name, :string
		add_column :institutions, :website, :string
		add_column :institutions, :phone_country_code, :integer
		add_column :institutions, :phone_number, :integer
		add_column :institutions, :address_line_one, :string
		add_column :institutions, :address_line_two, :string
		add_column :institutions, :address_line_three, :string
		add_column :institutions, :city, :string
		add_column :institutions, :state, :string
		add_column :institutions, :country, :string
		add_column :institutions, :zip_code, :integer
		add_column :institutions, :secondary_contact_email, :string
		add_column :institutions, :institution_code, :string
		add_index :institutions, :institution_code, unique: true
	end
end
