class AddObersvacionesToFacturaEfectivo < ActiveRecord::Migration
  def change
    add_column :factura_efectivos, :observaciones, :string
  end
end
