class PagoCheque < ActiveRecord::Base
  attr_accessible :anulada, :banco, :factura_credito_id, :fecha, :monto, :numero, :numero_cheque
  belongs_to :factura_credito
end
