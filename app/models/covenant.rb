class Covenant < ApplicationRecord
  belongs_to :discipleship
  # belongs_to :user
  mount_uploader :urlMultimedia, MultimediaUploader
end
