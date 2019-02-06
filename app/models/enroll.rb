class Enroll < ApplicationRecord
  belongs_to :group
  belongs_to :user

  has_many :failures
end
