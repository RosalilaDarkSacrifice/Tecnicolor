class EntradaProducto < ActiveRecord::Base
  attr_accessible :cantidad, :fecha, :producto_id, :proveedor_id
  belongs_to :producto
  belongs_to :proveedor
end
