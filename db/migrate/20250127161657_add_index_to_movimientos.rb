class AddIndexToMovimientos < ActiveRecord::Migration[7.2]
  def change
    add_index :movimientos, [:cuenta_id, :monto], name: 'index_movimientos_on_cuenta_and_monto'
    add_index :movimientos, [:cuenta_id, :monto_flotante], name: 'index_movimientos_on_cuenta_and_monto_flotante'
    #Ex:- add_index("admin_users", "username")
  end
end
