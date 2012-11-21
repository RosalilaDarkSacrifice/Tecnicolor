class PagoTarjetum < ActiveRecord::Base
  attr_accessible :anulada, :factura_credito_id, :fecha, :monto, :numero
  belongs_to :factura_credito
end
