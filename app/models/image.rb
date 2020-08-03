class Image < ApplicationRecord
  validates :name, presence: true

  mount_uploader :name, ImageUploader
  belongs_to :post
end
