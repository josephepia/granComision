class Enroll < ApplicationRecord
  belongs_to :discipleship
  belongs_to :student
  has_many :failures
end
