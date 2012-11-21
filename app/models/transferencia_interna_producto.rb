class TransferenciaInternaProducto < ActiveRecord::Base
  attr_accessible :categorium_id, :fecha, :producto_id, :cantidad, :cantidad_galones
	belongs_to :producto
  belongs_to :categorium
end
