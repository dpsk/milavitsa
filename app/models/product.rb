class Product < ActiveRecord::Base
  attr_accessible :description, :image, :price, :title, :image, :image_cache, :remove_image, :collection_id

  belongs_to :collection, counter_cache: true

  mount_uploader :image, ImageUploader

  validates :title, :price, presence: true
end
