class ClienteCredito < ActiveRecord::Base
  attr_accessible :celular_ref_1, :celular_ref_2, :direccion, :empresa, :limite_credito, :limite_dias, :nombre, :referencia_1, :referencia_2, :telefono_ref_1, :telefono_ref_2
  has_many :factura_creditos

	def getNombreYSaldo
		saldo=limite_credito
		if saldo == nil
			saldo = 0
		end
		factura_creditos.each do |factura_credito|
			if factura_credito.getSaldo>0 && factura_credito.getSaldo!=nil
				saldo=saldo-factura_credito.getSaldo
			end
		end
		return nombre+" - Credito restante: "+(saldo).to_s
	end
end
