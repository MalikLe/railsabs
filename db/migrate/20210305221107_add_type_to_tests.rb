class AddTypeToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :type, :integer
  end
end
