class ClienteCredito < ActiveRecord::Base
  attr_accessible :celular_ref_1, :celular_ref_2, :direccion, :empresa, :limite_credito, :limite_dias, :nombre, :referencia_1, :referencia_2, :telefono_ref_1, :telefono_ref_2
  has_many :factura_creditos
end
