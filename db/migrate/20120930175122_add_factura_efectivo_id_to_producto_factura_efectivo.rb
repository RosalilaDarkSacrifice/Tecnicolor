class AddFacturaEfectivoIdToProductoFacturaEfectivo < ActiveRecord::Migration
  def change
    add_column :producto_factura_efectivos, :factura_efectivo_id, :integer
  end
end
