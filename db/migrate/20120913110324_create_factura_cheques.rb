class CreateFacturaCheques < ActiveRecord::Migration
  def change
    create_table :factura_cheques do |t|
      t.date :fecha
      t.integer :numero
      t.string :cliente
      t.string :direccion
      t.string :numero_cheque
      t.string :banco
      t.boolean :anulada

      t.timestamps
    end
  end
end
