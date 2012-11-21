class FacturaCheque < ActiveRecord::Base
  attr_accessible :anulada, :banco, :cliente, :direccion, :fecha, :numero, :numero_cheque
  has_many :producto_factura_cheques

	def getSubtotal
		productos=producto_factura_cheques
		res=0
		productos.each do |p|
			if p.precio!=nil && p.cantidad!=nil
				res=res+((p.precio*100.0).round/100.0)*((p.cantidad*100.0).round/100.0)
			end
		end
		return res
	end

	def getTotal
		return (getSubtotal*100.0*1.12).round/100.0
	end

	def getCantidadFacturas
		return producto_factura_cheques.count
	end
end
