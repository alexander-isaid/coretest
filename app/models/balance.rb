# == Schema Information
#
# Table name: balances
#
#  id           :bigint           not null, primary key
#  lock_version :integer          default(0), not null
#  saldo        :decimal(10, 2)   default(0.0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cuenta_id    :bigint           not null
#
# Indexes
#
#  index_balances_on_cuenta_id  (cuenta_id)
#
# Foreign Keys
#
#  fk_rails_...  (cuenta_id => cuentas.id)
#
class Balance < ApplicationRecord
  belongs_to :cuenta
  

  def movimiento(amount, movimiento_id)
    begin

      redis_lock ||= BloqueoRedis.new
      if redis_lock.present?
        key = "lock:cuenta:#{self.cuenta_id}"
        redis_lock.lock_transction(key, ttl: 5, max_retries: 6, retry_delay: 2) do
          ActiveRecord::Base.transaction do
            self.lock!
            # #raise "Error de conexion +++++++" if (rand 5000%327) == 12
            # sleep(4) if (rand 5000%327) == 48
            movimiento = Movimiento.find(movimiento_id)
            movimiento.saldo_anterior = self.saldo
            nuevo_saldo = BigDecimal(self.saldo.to_s) + BigDecimal(amount.to_s)
            movimiento.saldo_actual = nuevo_saldo
            movimiento.estado = 'Finalizado'
            movimiento.save! 
            self.saldo = nuevo_saldo
            self.save!
            
          end
        end
      end
    rescue => e
      puts "#{e.message}".red
      movimiento.estado= "Error"
      movimiento.save!

    end  

  end





  def debito(amount)
    redis_lock ||= BloqueoRedis.new
    begin
      if redis_lock.present?
        key = "lock:cuenta:#{self.cuenta.id}"
        redis_lock.lock_transction(key, ttl: 5, max_retries: 5, retry_delay: 1) do
          ActiveRecord::Base.transaction do
            self.lock!
            new_saldo = BigDecimal(self.saldo.to_s) - BigDecimal(amount.to_s)
            raise "Saldo insuficiente" if new_saldo < 0
            update!(saldo: new_saldo)
          end
        end
      end
    rescue => e
      puts "Error: #{e.message}"
    end  

  end

  def credito(amount)
    redis_lock ||= BloqueoRedis.new
    begin
      if redis_lock.present?
        key = "lock:cuenta:#{self.cuenta.id}"
        redis_lock.lock_transction(key, ttl: 5, max_retries: 5, retry_delay: 1) do
          ActiveRecord::Base.transaction do
            self.lock!
            new_saldo = BigDecimal(self.saldo.to_s) + BigDecimal(amount.to_s)
            raise "Saldo insuficiente" if new_saldo < 0
            update!(saldo: new_saldo)
          end
        end
      end
    rescue => e
      puts "Error: #{e.message}"
    end    
  end

end
