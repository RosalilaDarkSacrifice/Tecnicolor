class AddCantidadGalonesToTransferenciaInternaProducto < ActiveRecord::Migration
  def change
    add_column :transferencia_interna_productos, :cantidad_galones, :float
  end
end
