class ProductoFacturaCheque < ActiveRecord::Base
  attr_accessible :cantidad, :factura_id, :precio, :producto_id
  belongs_to :factura_cheque
	belongs_to :producto
end
