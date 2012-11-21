class ProductoFacturaTarjetum < ActiveRecord::Base
  attr_accessible :cantidad, :factura_id, :precio, :producto_id
  belongs_to :factura_tarjetum
	belongs_to :producto
end
