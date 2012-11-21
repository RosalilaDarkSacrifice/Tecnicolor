class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :nombre
      t.string :direccion
      t.string :contacto_1
      t.string :telefono_1
      t.string :contacto_2
      t.string :telefono_2

      t.timestamps
    end
  end
end
