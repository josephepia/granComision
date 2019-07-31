class Material < ApplicationRecord
    has_many :publications
    mount_uploader :pdf, ArchivoUploader
    mount_uploader :imagen, ImagenUploader
end
