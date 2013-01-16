class AddObersvacionesToFacturaCredito < ActiveRecord::Migration
  def change
    add_column :factura_creditos, :observaciones, :string
  end
end
