class Schedule < ActiveRecord::Base
  attr_accessible :parity, :weekday_id, :pair_id, :room_id, :group_id, :teacher_id, :subject_id, :occupation, :deleted
  belongs_to :teacher
  belongs_to :pair
  belongs_to :room
  belongs_to :subject
  belongs_to :weekday
  belongs_to :group
end
