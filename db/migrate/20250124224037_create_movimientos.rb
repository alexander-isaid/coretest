class CreateMovimientos < ActiveRecord::Migration[7.2]
  def change
    create_table :movimientos do |t|
      t.references :transaccion, polymorphic: true, null: false
      t.references :cuenta, null: false, foreign_key: true
      t.decimal :monto_flotante, precision: 10, scale: 2, default: 0.0, null: false
      t.decimal :monto, precision: 10, scale: 2, default: 0.0, null: false
      t.decimal :saldo_anterior, precision: 10, scale: 2, default: 0.0, null: false
      t.decimal :saldo_actual, precision: 10, scale: 2, default: 0.0, null: false

      t.timestamps
    end
  end
end
