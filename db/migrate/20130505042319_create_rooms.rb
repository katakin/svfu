class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, :null => false
      t.references :building
      t.boolean :deleted, :null => false, :default => false
      t.timestamps
    end
    add_index :rooms, :building_id
  end
end
