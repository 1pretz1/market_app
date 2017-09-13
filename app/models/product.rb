class Product < ApplicationRecord

  belongs_to :user
  has_one :photo

  mount_uploader :image_url, ImageUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :image_url, presence: true
end
