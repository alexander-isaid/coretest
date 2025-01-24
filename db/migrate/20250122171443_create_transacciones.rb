class CreateTransacciones < ActiveRecord::Migration[7.2]
  def change
    create_table :transacciones do |t|
      t.references :cuenta, null: false, foreign_key: true
      t.decimal :monto, precision: 10, scale: 2, default: 0.0, null: false
      t.string :tipo
      t.string :descripcion
      t.datetime :fecha
      
      t.timestamps
    end
  end
end
