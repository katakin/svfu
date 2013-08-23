class Level < ActiveRecord::Base
  attr_accessible :name, :deleted
  has_many :groups
end
