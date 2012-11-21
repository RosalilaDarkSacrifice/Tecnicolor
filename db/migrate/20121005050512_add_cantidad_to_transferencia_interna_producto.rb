class AddCantidadToTransferenciaInternaProducto < ActiveRecord::Migration
  def change
    add_column :transferencia_interna_productos, :cantidad, :float
  end
end
