class CreateCuentas < ActiveRecord::Migration[7.2]
  def change
    create_table :cuentas do |t|
      t.string :numero
      t.string :nombre
      t.decimal :disponible, precision: 10, scale: 2, default: 0.0, null: false

      t.timestamps
    end
  end
end
