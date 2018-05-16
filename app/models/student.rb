class Student < ApplicationRecord
  belongs_to :user
  has_one :enroll
  has_many :extendednotes
  has_many :covenants

end
