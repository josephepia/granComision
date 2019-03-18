class Covenant < ApplicationRecord
  belongs_to :discipleship
  # belongs_to :user
  has_and_belongs_to_many :users
  mount_uploader :urlMultimedia, PdfUploader
end
