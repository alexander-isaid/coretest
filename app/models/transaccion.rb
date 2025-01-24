# == Schema Information
#
# Table name: transacciones
#
#  id             :bigint           not null, primary key
#  descripcion    :string
#  estado         :string
#  fecha          :datetime
#  monto          :decimal(10, 2)   default(0.0), not null
#  saldo_actual   :decimal(10, 2)   default(0.0), not null
#  saldo_anterior :decimal(10, 2)   default(0.0), not null
#  tipo           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  cuenta_id      :bigint           not null
#
# Indexes
#
#  index_transacciones_on_cuenta_id  (cuenta_id)
#
# Foreign Keys
#
#  fk_rails_...  (cuenta_id => cuentas.id)
#
class Transaccion < ApplicationRecord
  belongs_to :cuenta
  validates_inclusion_of :tipo, in: %w(Credito Debito), on: :create, message: "extension %s is not included in the list"

  validate :calcular_balance, on: :create

  after_create :actualizar_balance


  def actualizar_balance
    balance = Balance.find_by(cuenta_id: self.cuenta_id)
    #self.saldo_anterior = balance.saldo

    if tipo == "Credito"
      balance.movimiento(self.monto, self.id)
      #self.saldo_actual = BigDecimal(self.saldo_anterior.to_s) + BigDecimal(self.monto.to_s)
    else
      balance.movimiento(self.monto * -1, self.id)
      #self.saldo_actual = BigDecimal(self.saldo_anterior.to_s) - BigDecimal(self.monto.to_s)
    end

  end

  private
    def calcular_balance
      if tipo == "Debito"
        if cuenta.balance.saldo < self.monto
          errors.add(:monto, "Saldo insuficiente")
        end
      end
    end

end
