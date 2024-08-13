class RemoveWebsiteFromInstitution < ActiveRecord::Migration[7.1]
  def change
	  remove_column :institutions, :website
  end
end
