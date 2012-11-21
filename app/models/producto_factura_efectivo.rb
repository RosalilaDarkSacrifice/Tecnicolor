class ProductoFacturaEfectivo < ActiveRecord::Base
  attr_accessible :cantidad, :factura_id, :precio, :producto_id
  belongs_to :factura_efectivo
	belongs_to :producto
end
