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


  def self.limpiar(cuenta)

    cuenta = Cuenta.find(cuenta)
    cuenta.balance.update(saldo: 0)
    Transaccion.delete_all

  end



  def movimiento(amount, transaccion_id)
    redis_lock ||= BloqueoRedis.new
    transaccion = Transaccion.find(transaccion_id)
    begin
      if redis_lock.present?
        key = "lock:cuenta:#{self.cuenta.id}"
        redis_lock.lock_transction(key, ttl: 5, max_retries: 5, retry_delay: 1) do
          ActiveRecord::Base.transaction do
            self.lock!

            #raise "Error de conexion +++++++" if (rand 5000%327) == 12

            sleep(4) if (rand 5000%327) == 48

            transaccion.saldo_anterior = self.saldo
            transaccion.save! 

            new_saldo = BigDecimal(self.saldo.to_s) + BigDecimal(amount.to_s)
            raise "Saldo insuficiente" if new_saldo < 0

            transaccion.saldo_actual = new_saldo
            transaccion.save! 

            self.saldo = new_saldo
            self.save!
            
          end
        end
      end
    rescue => e
      transaccion.estado= "Error #{e.message}"
      transaccion.save!
      puts "Error: #{e.message}"
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
