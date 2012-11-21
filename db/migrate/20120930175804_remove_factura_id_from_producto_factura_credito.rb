class RemoveFacturaIdFromProductoFacturaCredito < ActiveRecord::Migration
  def up
    remove_column :producto_factura_creditos, :factura_id
  end

  def down
    add_column :producto_factura_creditos, :factura_id, :integer
  end
end
