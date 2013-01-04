class AddTipoReporteToCategorium < ActiveRecord::Migration
  def change
    add_column :categoria, :tipo_reporte, :string
  end
end
