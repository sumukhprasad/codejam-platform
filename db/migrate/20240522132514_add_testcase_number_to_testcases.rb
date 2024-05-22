class AddTestcaseNumberToTestcases < ActiveRecord::Migration[7.1]
  def change
    add_column :testcases, :testcase_number, :integer
    add_index :testcases, [:testcase_number, :question_id], unique: true
  end
end
