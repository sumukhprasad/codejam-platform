class CreateTestcases < ActiveRecord::Migration[7.1]
	def change
		create_table :testcases do |t|
			t.string :title

			t.timestamps
		end
	end
end
