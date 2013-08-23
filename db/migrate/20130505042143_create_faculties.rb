class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name, :null => false, :unique => true
      t.string :url
      t.boolean :deleted, :null => false, :default => false
      
      t.timestamps
    end
  end
end
