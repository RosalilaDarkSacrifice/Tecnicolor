class AddVariosToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :precio_costo, :float
    add_column :productos, :cantidad_galones, :float
  end
end
