class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name, :null => false, :unique => true
      t.boolean :deleted, :null => false, :default => false

      t.timestamps
    end
  end
end
