class AddClassIdToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :class_id, :integer
    add_index :students, :class_id
  end
end
