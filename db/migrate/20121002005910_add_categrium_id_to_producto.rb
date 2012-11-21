class AddCategriumIdToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :categorium_id, :integer
  end
end
