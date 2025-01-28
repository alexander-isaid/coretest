class AddTipoOperacionToMovimientos < ActiveRecord::Migration[7.2]
  def change
    add_column :movimientos, :tipo_operacion, :string
  end
end
