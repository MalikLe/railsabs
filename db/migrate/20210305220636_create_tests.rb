class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.integer :subject_id
      t.integer :group_id

      t.timestamps
    end
    add_index :tests, :subject_id
    add_index :tests, :group_id
  end
end
