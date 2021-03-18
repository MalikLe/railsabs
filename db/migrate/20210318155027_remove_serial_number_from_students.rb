class RemoveSerialNumberFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :serial_number, :integer
  end
end
