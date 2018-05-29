class Group < ApplicationRecord
  belongs_to :discipleship
  belongs_to :teacher,optional: true
  has_one :horary
  has_many :sessions
  has_many :enrolls
  has_many :publications
end
