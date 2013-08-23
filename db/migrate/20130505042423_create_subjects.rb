class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name, :null => false, :unique => true
      t.references :faculty
      t.boolean :deleted, :null => false, :default => false
      t.timestamps
    end
    add_index :subjects, :faculty_id
  end
end
