class Discipleship < ApplicationRecord
    has_many :givencourses
    has_many :groups, dependent: :destroy
    has_many :extendednotes
    has_many :covenants
    has_many :lessons
end
