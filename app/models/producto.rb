class Producto < ActiveRecord::Base

attr_accessible :categorium_id, :descripcion, :marca_id, :nombre, :precio_maximo, :precio_minimo, :cantidad_galones, :precio_costo, :existencias
  belongs_to :marca
  belongs_to :categorium
	has_many :producto_factura_cheques
	has_many :producto_factura_creditos
	has_many :producto_factura_efectivos
	has_many :producto_factura_factura
	has_many :entrada_productos
	has_many :salida_producto_mal_estados
	has_many :transferencia_interna_producto
end
