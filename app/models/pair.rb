class Pair < ActiveRecord::Base
  attr_accessible :name, :duration, :deleted
  has_many :schedules
end
