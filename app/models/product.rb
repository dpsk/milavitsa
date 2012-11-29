class Product < ActiveRecord::Base
  attr_accessible :description, :image, :price, :title, :image, :image_cache, :remove_image

  mount_uploader :image, ImageUploader

  validates :title, :price, presence: true

  before_save :add_tax

end
