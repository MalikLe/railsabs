class AddSerialNumberToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :serial_number, :integer
  end
end
