class Publication < ApplicationRecord
  belongs_to :material,optional: true
  belongs_to :group,optional: true
  belongs_to :user
  has_many :commentaries
  mount_uploader :imagen, ImagenUploader
  mount_uploader :multimedia, ArchivoUploader

end
