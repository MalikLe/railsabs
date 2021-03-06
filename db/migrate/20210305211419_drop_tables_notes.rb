class DropTablesNotes < ActiveRecord::Migration[6.1]
  def change
  	drop_table :tests
  	drop_table :subjects
  	drop_table :results
  end
end
