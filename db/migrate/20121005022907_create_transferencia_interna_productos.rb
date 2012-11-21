class CreateTransferenciaInternaProductos < ActiveRecord::Migration
  def change
    create_table :transferencia_interna_productos do |t|
      t.date :fecha
      t.integer :producto_id
      t.integer :categoria_id

      t.timestamps
    end
  end
end
