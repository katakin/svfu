class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :fio, :null => false
      t.references :faculty
      t.references :subject
      t.boolean :deleted, :null => false, :default => false   
      t.timestamps
    end
    
    create_table :faculties_teachers do |t|
      t.references :faculty
      t.references :teacher
    end
    add_index :faculties_teachers, :faculty_id
    add_index :faculties_teachers, :teacher_id
    
    create_table :subjects_teachers do |t|
      t.references :subject
      t.references :teacher
    end
    add_index :subjects_teachers, :subject_id
    add_index :subjects_teachers, :teacher_id
  end
end
