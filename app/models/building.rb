class Building < ActiveRecord::Base
  attr_accessible :name, :deleted
  has_many :rooms
end
