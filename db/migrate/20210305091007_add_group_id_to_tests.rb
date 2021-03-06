class AddGroupIdToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :group_id, :integer
    add_index :tests, :group_id
  end
end
