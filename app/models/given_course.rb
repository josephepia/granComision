class GivenCourse < ApplicationRecord
  belongs_to :discipleship
  belongs_to :user
end
