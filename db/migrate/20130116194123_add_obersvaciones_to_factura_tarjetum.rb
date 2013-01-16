class AddObersvacionesToFacturaTarjetum < ActiveRecord::Migration
  def change
    add_column :factura_tarjeta, :observaciones, :string
  end
end
