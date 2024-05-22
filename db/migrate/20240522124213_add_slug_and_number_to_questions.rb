class AddSlugAndNumberToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :number, :integer
    add_index :questions, :number, unique: true
    add_column :questions, :slug, :string
    add_index :questions, :slug, unique: true
  end
end
