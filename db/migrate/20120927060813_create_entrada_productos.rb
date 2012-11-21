class CreateEntradaProductos < ActiveRecord::Migration
  def change
    create_table :entrada_productos do |t|
      t.date :fecha
      t.integer :producto_id
      t.integer :proveedor_id
      t.float :cantidad

      t.timestamps
    end
  end
end
