class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, throgh: :favorites, source: :user
end
