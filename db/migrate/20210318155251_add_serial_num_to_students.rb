class AddSerialNumToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :serial_num, :string
  end
end
