class CreateBalances < ActiveRecord::Migration[7.2]
  def change
    create_table :balances do |t|
      t.references :cuenta, null: false, foreign_key: true
      t.decimal :saldo, precision: 10, scale: 2, default: 0.0, null: false
      t.integer :lock_version, default: 0, null: false

      t.timestamps
    end
  end
end
