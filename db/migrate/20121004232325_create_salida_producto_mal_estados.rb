class CreateSalidaProductoMalEstados < ActiveRecord::Migration
  def change
    create_table :salida_producto_mal_estados do |t|
      t.date :fecha
      t.integer :producto_id
      t.float :cantidad

      t.timestamps
    end
  end
end
