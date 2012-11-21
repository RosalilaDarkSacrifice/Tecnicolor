class CreateProductoFacturaTarjeta < ActiveRecord::Migration
  def change
    create_table :producto_factura_tarjeta do |t|
      t.integer :producto_id
      t.integer :factura_id
      t.float :cantidad
      t.float :precio

      t.timestamps
    end
  end
end
