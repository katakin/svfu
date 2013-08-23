class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :name, :null => false
      t.string :duration
      t.boolean :deleted, :null => false, :default => false
      
      t.timestamps
    end
  end
end
