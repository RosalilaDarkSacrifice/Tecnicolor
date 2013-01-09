class Categorium < ActiveRecord::Base
  attr_accessible :nombre,:tipo_reporte, :entradas, :salidas, :ventas
  has_many :productos
	has_many :transferencia_interna_productos
end
