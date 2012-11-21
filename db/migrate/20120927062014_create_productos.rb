class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :categoria_id
      t.integer :marca_id
      t.float :precio_maximo
      t.float :precio_minimo

      t.timestamps
    end
  end
end
