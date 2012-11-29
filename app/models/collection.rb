class Collection < ActiveRecord::Base
  attr_accessible :name, :products_count

  has_many :products
end
