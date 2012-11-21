class AddFacturaTarjetumIdToProductoFacturaTarjetum < ActiveRecord::Migration
  def change
    add_column :producto_factura_tarjeta, :factura_tarjetum_id, :integer
  end
end
