class AddEstadoToTransaccion < ActiveRecord::Migration[7.2]
  def change
    add_column :transacciones, :estado, :string
  end
end
