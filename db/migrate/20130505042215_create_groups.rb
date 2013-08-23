class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, :null => false
      t.references :faculty
      t.references :level
      t.boolean :deleted, :null => false, :default => false
      
      t.timestamps
    end
    add_index :groups, :faculty_id
    add_index :groups, :level_id
  end
end
