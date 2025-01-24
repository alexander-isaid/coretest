class AddSaldosToTransacciones < ActiveRecord::Migration[7.2]
  def change
    add_column :transacciones, :saldo_anterior, :decimal, precision: 10, scale: 2, default: 0.0, null: false
    add_column :transacciones, :saldo_actual, :decimal, precision: 10, scale: 2, default: 0.0, null: false
  end
end
