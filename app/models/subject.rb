class Subject < ActiveRecord::Base
  attr_accessible :name, :deleted, :teacher_ids
  belongs_to :faculty
  has_many :schedules
  has_and_belongs_to_many :teachers
end
