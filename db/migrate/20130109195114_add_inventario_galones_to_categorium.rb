class AddInventarioGalonesToCategorium < ActiveRecord::Migration
  def change
    add_column :categoria, :entradas, :decimal
    add_column :categoria, :salidas, :decimal
    add_column :categoria, :ventas, :decimal
  end
end
