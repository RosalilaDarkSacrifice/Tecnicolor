class RemoveFacturaIdFromProductoFacturaTarjetum < ActiveRecord::Migration
  def up
    remove_column :producto_factura_tarjeta, :factura_id
  end

  def down
    add_column :producto_factura_tarjeta, :factura_id, :integer
  end
end
