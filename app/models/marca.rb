class Marca < ActiveRecord::Base
  attr_accessible :nombre
  has_many :products
end
