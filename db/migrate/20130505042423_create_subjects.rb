class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name, :null => false, :unique => true
      t.references :teachers
      t.boolean :deleted, :null => false, :default => false
      t.timestamps
    end
  end
end
