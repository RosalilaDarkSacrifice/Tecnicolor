class AddFacturaCreditoIdToProductoFacturaCredito < ActiveRecord::Migration
  def change
    add_column :producto_factura_creditos, :factura_credito_id, :integer
  end
end
