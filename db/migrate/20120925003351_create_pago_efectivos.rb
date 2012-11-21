class CreatePagoEfectivos < ActiveRecord::Migration
  def change
    create_table :pago_efectivos do |t|
      t.integer :factura_credito_id
      t.date :fecha
      t.integer :numero
      t.boolean :anulada
      t.float :monto

      t.timestamps
    end
  end
end
