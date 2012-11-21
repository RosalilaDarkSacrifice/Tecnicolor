class AddCategoriumIdToTransferenciaInternaProductos < ActiveRecord::Migration
  def change
    add_column :transferencia_interna_productos, :categorium_id, :integer
  end
end
