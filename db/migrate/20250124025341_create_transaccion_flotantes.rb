class CreateTransaccionFlotantes < ActiveRecord::Migration[7.2]
  def change
    create_table :transaccion_flotantes do |t|
      t.references :cuenta, null: false, foreign_key: true
      t.string :descripcion
      t.string :estado
      t.datetime :fecha
      t.decimal :saldo_anterior, precision: 10, scale: 2, default: 0.0, null: false
      t.decimal :monto, precision: 10, scale: 2, default: 0.0, null: false
      t.decimal :saldo_actual, precision: 10, scale: 2, default: 0.0, null: false
      t.string :tipo

      t.timestamps
    end
  end
end
