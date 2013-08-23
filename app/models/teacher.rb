class Teacher < ActiveRecord::Base
  attr_accessible :fio, :deleted, :faculty_ids, :subject_ids
  has_many :schedules 
  has_and_belongs_to_many :faculties
  has_and_belongs_to_many :subjects
end
