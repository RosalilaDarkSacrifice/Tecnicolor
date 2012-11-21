class FacturaCredito < ActiveRecord::Base
  attr_accessible :anulada, :cliente_credito_id, :estado, :fecha, :numero
  has_many :pago_cheques
  has_many :pago_efectivos
  has_many :pago_tarjeta
  has_many :producto_factura_creditos
  belongs_to :cliente_credito

	def getSubtotal
		productos=producto_factura_creditos
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
		return producto_factura_creditos.count
	end

	def getTotalPagos
		res=0
		pago_cheques.each do |p|
			res+=p.monto
		end
		pago_efectivos.each do |p|
			res+=p.monto
		end
		pago_tarjeta.each do |p|
			res+=p.monto
		end
		return res
	end
end
