class Weekday < ActiveRecord::Base
  attr_accessible :name, :deleted
  has_many :schedules
end
