# == Schema Information
#
# Table name: transaccion_flotantes
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
#  index_transaccion_flotantes_on_cuenta_id  (cuenta_id)
#
# Foreign Keys
#
#  fk_rails_...  (cuenta_id => cuentas.id)
#
class TransaccionFlotante < ApplicationRecord
  belongs_to :cuenta
  has_one :movimiento, dependent: :destroy

  after_create :create_movimiento
  validates_inclusion_of :tipo, in: %w(Credito Debito), on: :create, message: "extension %s is not included in the list"


  def create_movimiento

    begin
      if self.estado == 'Recibido'
        movimiento = Movimiento.new
        movimiento.transaccion_flotante_id = self.id
        movimiento.cuenta_id = self.cuenta_id
        if self.tipo == 'Credito'
          movimiento.monto_flotante = self.monto
        else
          movimiento.monto_flotante = (self.monto * -1)
        end
        movimiento.save!
      end
  
      # redis_lock ||= BloqueoRedis.new
      # key = "lock:cuenta:#{self.cuenta_id}"
      # redis_lock.lock_transction(key, ttl: 15, max_retries: 5, retry_delay: 1) do
      #   ActiveRecord::Base.transaction do
      #     movimiento = Movimiento.new
      #     movimiento.transaccion_flotante_id = self.id
      #     movimiento.cuenta_id = self.cuenta_id
      #     monto_flotante = self.cuenta.movimientos.sum(:monto_flotante)
      #     monto = self.cuenta.movimientos.sum(:monto)
      #     saldo = monto_flotante + monto
      #     movimiento.saldo_anterior =  saldo
      #     if self.tipo == 'Credito'
      #       movimiento.monto_flotante = self.monto
      #     else
      #       movimiento.monto_flotante = (self.monto * -1)
      #     end
      #     movimiento.saldo_actual   =  movimiento.saldo_anterior + movimiento.monto
      #     movimiento.save!
      #   end
      # end
    rescue => e
      puts "#{e.message}"
      self.estado = "Error"
      self.save!
    end
  end


  # def actualizar_balance
  #   # balance = self.cuenta.balance
  #   # self.saldo_anterior = balance.saldo
  #   if tipo == "Credito"
  #     balance.movimiento(self.monto, self.movimiento_id)
  #     #self.saldo_actual = BigDecimal(self.saldo_anterior.to_s) + BigDecimal(self.monto.to_s)
  #   else
  #     balance.movimiento(self.monto * -1, self.movimiento_id)
  #     #self.saldo_actual = BigDecimal(self.saldo_anterior.to_s) - BigDecimal(self.monto.to_s)
  #   end
  #   #self.save!
  # end


end
