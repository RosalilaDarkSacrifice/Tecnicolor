class AddExistenciasToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :existencias, :float
  end
end
