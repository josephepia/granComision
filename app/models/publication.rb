class Publication < ApplicationRecord
  belongs_to :material
  belongs_to :group
  has_many :commentaries
end
