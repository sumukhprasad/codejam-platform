class RemoveTitleFromTestcases < ActiveRecord::Migration[7.1]
	def change
		remove_column :testcases, :title
	end
end
