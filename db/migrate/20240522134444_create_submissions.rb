class CreateSubmissions < ActiveRecord::Migration[7.1]
  def change
    create_table :submissions do |t|
      t.string :result
      t.references :question, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.boolean :is_correct
      t.boolean :gold_star

      t.timestamps
    end
  end
end
