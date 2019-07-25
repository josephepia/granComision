class Publication < ApplicationRecord
  belongs_to :material,optional: true
  belongs_to :group,optional: true
  has_many :commentaries
  mount_uploader :imagen, ImagenUploader
end
