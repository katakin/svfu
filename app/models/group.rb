class Group < ActiveRecord::Base
  belongs_to :faculty
  belongs_to :level
  attr_accessible :name, :deleted, :faculty_id, :level_id
  has_many :schedules
end