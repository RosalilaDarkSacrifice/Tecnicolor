class Categorium < ActiveRecord::Base
  attr_accessible :nombre
  has_many :productos
	has_many :transferencia_interna_productos
end
