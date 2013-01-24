class FacturaCredito < ActiveRecord::Base
  attr_accessible :anulada, :cliente_credito_id, :estado, :fecha, :numero, :observaciones
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
		return (res*100.0).round/100.0
	end

	def getTotal
		return (getSubtotal*100*1.12).round/100.0
	end

	def getISV
		return (getSubtotal*100.0*0.12).round/100.0
	end

	def getCantidadFacturas
		return producto_factura_creditos.count
	end

	def getTotalPagos
		res=0
		pago_cheques.each do |p|
			if p.anulada!=true
				res+=p.monto
			end
		end
		pago_efectivos.each do |p|
			if p.anulada!=true
				res+=p.monto
			end
		end
		pago_tarjeta.each do |p|
			if p.anulada!=true
				res+=p.monto
			end
		end
		return res
	end

	def getSaldo
		return getTotal.ceil-getTotalPagos
	end
end
