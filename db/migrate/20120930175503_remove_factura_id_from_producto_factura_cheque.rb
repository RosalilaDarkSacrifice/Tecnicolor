class RemoveFacturaIdFromProductoFacturaCheque < ActiveRecord::Migration
  def up
    remove_column :producto_factura_cheques, :factura_id
  end

  def down
    add_column :producto_factura_cheques, :factura_id, :integer
  end
end
