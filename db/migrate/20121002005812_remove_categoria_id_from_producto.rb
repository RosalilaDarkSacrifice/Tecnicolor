class RemoveCategoriaIdFromProducto < ActiveRecord::Migration
  def up
    remove_column :productos, :categoria_id
  end

  def down
    add_column :productos, :categoria_id, :integer
  end
end
