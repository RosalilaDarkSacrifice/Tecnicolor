class ProductoFacturaCredito < ActiveRecord::Base
  attr_accessible :cantidad, :factura_id, :precio, :producto_id
  belongs_to :factura_credito
	belongs_to :producto
end
