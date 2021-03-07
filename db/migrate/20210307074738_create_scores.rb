class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.decimal :score
      t.integer :student_id
      t.integer :test_id

      t.timestamps
    end
    add_index :scores, :student_id
    add_index :scores, :test_id
  end
end
