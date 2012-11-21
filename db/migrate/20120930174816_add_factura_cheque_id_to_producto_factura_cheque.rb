class AddFacturaChequeIdToProductoFacturaCheque < ActiveRecord::Migration
  def change
    add_column :producto_factura_cheques, :factura_cheque_id, :integer
  end
end
