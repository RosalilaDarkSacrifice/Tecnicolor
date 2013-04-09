class AddDensidadToCategoria < ActiveRecord::Migration
  def change
    add_column :categoria, :densidad, :iteger
  end
end
