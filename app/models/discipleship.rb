class Discipleship < ApplicationRecord
    has_many :givencourses
    has_many :groups, dependent: :destroy
    has_many :extendednotes
    has_many :covenants
    has_many :lessons
    accepts_nested_attributes_for :covenants, allow_destroy: true, reject_if: lambda {|attributes| attributes['kind'].blank?}
    accepts_nested_attributes_for :lessons , allow_destroy: true,  reject_if: lambda {|attributes| attributes['kind'].blank?}
end
