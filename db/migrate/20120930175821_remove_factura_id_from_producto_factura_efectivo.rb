class RemoveFacturaIdFromProductoFacturaEfectivo < ActiveRecord::Migration
  def up
    remove_column :producto_factura_efectivos, :factura_id
  end

  def down
    add_column :producto_factura_efectivos, :factura_id, :integer
  end
end
