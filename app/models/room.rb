class Room < ActiveRecord::Base
  belongs_to :building
  attr_accessible :name, :building_id, :deleted
  has_many :schedules
end
