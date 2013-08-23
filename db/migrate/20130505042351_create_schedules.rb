class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :parity, :null => false, :default => 0
      t.string :occupation
      t.references :teacher
      t.references :pair
      t.references :room
      t.references :subject
      t.references :weekday
      t.references :group
      t.boolean :deleted, :null => false, :default => false
      
      t.timestamps
    end
    add_index :schedules, :teacher_id
    add_index :schedules, :pair_id
    add_index :schedules, :room_id
    add_index :schedules, :subject_id
    add_index :schedules, :weekday_id
    add_index :schedules, :group_id
  end
end
