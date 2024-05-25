class AddTestcaseNumberToStudents < ActiveRecord::Migration[7.1]
	def change
		add_column :students, :testcase_number, :integer
	end
end
