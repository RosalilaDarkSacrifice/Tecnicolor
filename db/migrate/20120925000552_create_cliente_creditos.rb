class CreateClienteCreditos < ActiveRecord::Migration
  def change
    create_table :cliente_creditos do |t|
      t.string :nombre
      t.text :direccion
      t.string :empresa
      t.integer :limite_credito
      t.integer :limite_dias
      t.string :referencia_1
      t.string :telefono_ref_1
      t.string :celular_ref_1
      t.string :referencia_2
      t.string :telefono_ref_2
      t.string :celular_ref_2

      t.timestamps
    end
  end
end
