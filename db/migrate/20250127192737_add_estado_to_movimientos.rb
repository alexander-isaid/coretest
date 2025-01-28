class AddEstadoToMovimientos < ActiveRecord::Migration[7.2]
  def change
    add_column :movimientos, :estado, :string
  end
end
