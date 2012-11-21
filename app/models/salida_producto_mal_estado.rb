class SalidaProductoMalEstado < ActiveRecord::Base
  attr_accessible :cantidad, :fecha, :producto_id
	belongs_to :producto
end
