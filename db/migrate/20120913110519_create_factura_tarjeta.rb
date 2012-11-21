class CreateFacturaTarjeta < ActiveRecord::Migration
  def change
    create_table :factura_tarjeta do |t|
      t.date :fecha
      t.integer :numero
      t.string :cliente
      t.string :direccion
      t.boolean :anulada

      t.timestamps
    end
  end
end
