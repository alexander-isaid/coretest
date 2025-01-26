# == Schema Information
#
# Table name: movimientos
#
#  id                      :bigint           not null, primary key
#  monto                   :decimal(10, 2)   default(0.0), not null
#  monto_flotante          :decimal(10, 2)   default(0.0), not null
#  saldo_actual            :decimal(10, 2)   default(0.0), not null
#  saldo_anterior          :decimal(10, 2)   default(0.0), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  cuenta_id               :bigint           not null
#  transaccion_flotante_id :bigint
#  transaccion_id          :bigint
#
# Indexes
#
#  index_movimientos_on_cuenta_id                (cuenta_id)
#  index_movimientos_on_transaccion_flotante_id  (transaccion_flotante_id)
#  index_movimientos_on_transaccion_id           (transaccion_id)
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
end
