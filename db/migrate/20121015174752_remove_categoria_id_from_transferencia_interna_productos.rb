class RemoveCategoriaIdFromTransferenciaInternaProductos < ActiveRecord::Migration
  def up
    remove_column :transferencia_interna_productos, :categoria_id
  end

  def down
    add_column :transferencia_interna_productos, :categoria_id, :integer
  end
end
