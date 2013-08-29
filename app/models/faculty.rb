class Faculty < ActiveRecord::Base
  attr_accessible :name, :url, :deleted, :teacher_ids
  has_many :groups
  has_many :users
  has_and_belongs_to_many :teachers
end
