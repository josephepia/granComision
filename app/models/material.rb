class Material < ApplicationRecord
    has_many :publications
    mount_uploader :pdf, MultimediaUploader
end
