class CreateFacturaCreditos < ActiveRecord::Migration
  def change
    create_table :factura_creditos do |t|
      t.date :fecha
      t.integer :numero
      t.integer :cliente_credito_id
      t.string :estado
      t.boolean :anulada

      t.timestamps
    end
  end
end
