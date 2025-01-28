# == Schema Information
#
# Table name: movimientos
#
#  id                      :bigint           not null, primary key
#  estado                  :string
#  monto                   :decimal(10, 2)   default(0.0), not null
#  monto_flotante          :decimal(10, 2)   default(0.0), not null
#  saldo_actual            :decimal(10, 2)   default(0.0), not null
#  saldo_anterior          :decimal(10, 2)   default(0.0), not null
#  tipo_operacion          :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  cuenta_id               :bigint           not null
#  transaccion_flotante_id :bigint
#  transaccion_id          :bigint
#
# Indexes
#
#  index_movimientos_on_cuenta_and_monto           (cuenta_id,monto)
#  index_movimientos_on_cuenta_and_monto_flotante  (cuenta_id,monto_flotante)
#  index_movimientos_on_cuenta_id                  (cuenta_id)
#  index_movimientos_on_transaccion_flotante_id    (transaccion_flotante_id)
#  index_movimientos_on_transaccion_id             (transaccion_id)
#
# Foreign Keys
#
#  fk_rails_...  (cuenta_id => cuentas.id)
#  fk_rails_...  (transaccion_flotante_id => transaccion_flotantes.id)
#  fk_rails_...  (transaccion_id => transacciones.id)
#
class Movimiento < ApplicationRecord
  belongs_to :cuenta
  belongs_to :transaccion, optional: true
  belongs_to :transaccion_flotante, optional: true
  
 

  def procesar_movimientos
    balance = self.cuenta.balance
    if self.tipo_operacion == "Credito"
      balance.movimiento(self.monto, self.id)
    else
      balance.movimiento(self.monto * -1, self.id)
    end
  end

  def actualizar_balance(cuenta_id)
    cuenta = Cuenta.find_by(cuenta_id)
    Movimiento.where(cuenta_id: cuenta_id).each do |movimiento|
      if self.estado == "Error"
        self.procesar_movimientos
      end
    end
    saldo = cuenta.movimientos.sum(:monto)
    cuenta.balance.update(saldo: saldo)

  end


  
end
