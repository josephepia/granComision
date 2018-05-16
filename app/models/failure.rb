class Failure < ApplicationRecord
  belongs_to :enroll
  belongs_to :session
end
