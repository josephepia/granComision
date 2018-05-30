class Enroll < ApplicationRecord
  belongs_to :group
  belongs_to :student

  has_many :failures
end
