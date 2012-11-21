class CreatePagoCheques < ActiveRecord::Migration
  def change
    create_table :pago_cheques do |t|
      t.integer :factura_credito_id
      t.date :fecha
      t.integer :numero
      t.boolean :anulada
      t.float :monto
      t.string :banco
      t.string :numero_cheque

      t.timestamps
    end
  end
end
