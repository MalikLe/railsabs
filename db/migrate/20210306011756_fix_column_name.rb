class FixColumnName < ActiveRecord::Migration[6.1]
  def change
  	rename_column :tests, :type, :test_type
  end
end
