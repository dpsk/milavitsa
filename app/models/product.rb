class Product < ActiveRecord::Base
  attr_accessible :description, :image, :price, :title, :image, :image_cache, :remove_image

  TAX = 1.7

  mount_uploader :image, ImageUploader

  validates :title, :price, presence: true

  before_save :add_tax

  def add_tax
    self.price = price * Product::TAX
  end

end
