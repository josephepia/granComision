class City < ApplicationRecord
  belongs_to :department
  has_many :districts
  has_many :addresschurchanddocumentexpeditions
end
