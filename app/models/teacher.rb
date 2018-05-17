class Teacher < ApplicationRecord
  belongs_to :user
  has_many :givencourses
end
