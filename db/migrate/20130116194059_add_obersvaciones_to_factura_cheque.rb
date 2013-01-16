class AddObersvacionesToFacturaCheque < ActiveRecord::Migration
  def change
    add_column :factura_cheques, :observaciones, :string
  end
end
