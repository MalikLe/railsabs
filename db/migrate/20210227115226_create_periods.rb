class CreatePeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :periods do |t|
      t.integer :week_id
      t.integer :day
      t.integer :student_id
      t.integer :state

      t.timestamps
    end
    add_index :periods, :week_id
    add_index :periods, :student_id
  end
end
