class FacturaTarjetum < ActiveRecord::Base
  attr_accessible :anulada, :cliente, :direccion, :fecha, :numero
  has_many :producto_factura_tarjeta

	def getSubtotal
		productos=producto_factura_tarjeta
		res=0
		productos.each do |p|
			if p.precio!=nil && p.cantidad!=nil
				res=res+((p.precio*100.0).round/100.0)*((p.cantidad*100.0).round/100.0)
			end
		end
		return res
	end

	def getTotal
		return (getSubtotal*100*1.12).round/100.0
	end

	def getCantidadFacturas
		return producto_factura_tarjeta.count
	end
end
