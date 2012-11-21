class Proveedor < ActiveRecord::Base
  attr_accessible :contacto_1, :contacto_2, :direccion, :nombre, :telefono_1, :telefono_2
  has_many :entrada_productos
end
