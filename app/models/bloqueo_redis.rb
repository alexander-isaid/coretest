class BloqueoRedis
  attr_reader :redis, :timeout
  def initialize()
    @redis = Redis.new(url: "redis://127.0.0.1:6379")
  end


  def lock_transction(lock_key, ttl: 10, max_retries: 3, retry_delay: 1 &block)
    lock_value = SecureRandom.uuid # Valor único para identificar el bloqueo
    retries = 0
    begin
      # Intenta adquirir el bloqueo
      if redis.set(lock_key, lock_value, nx: true, ex: ttl)
        begin
          # Ejecuta el bloque de código protegido por el bloqueo
          yield
        ensure
          # Libera el bloqueo solo si fue adquirido por esta operación
          redis.del(lock_key) if redis.get(lock_key) == lock_value
        end
      else
        raise 'No se pudo adquirir el bloqueo'
      end
    rescue => e
      retries += 1
      if retries <= max_retries
        puts "Recurso bloqueado, reintentando (Intento #{retries} de #{max_retries})..."
        sleep(retry_delay) # Espera antes de reintentar
        retry # Vuelve a intentar el bloque completo
      else
        raise "Error: #{e.message} después de #{max_retries} intentos."
      end
    end
  end

  # Manejo de hashes: Establecer un campo en un hash (HSET)
  def hset(hash_key, field, value)
    created = false
    valor = @redis.hset(hash_key, field, value)
    created = true if valor == 1
    created
  end
  # Manejo de hashes: Obtener el valor de un campo en un hash (HGET)
  def hget(hash_key, field)
    @redis.hget(hash_key, field)
  end

  def hgetall(hash_key)
    @redis.hgetall(hash_key)
  end

  # Manejo de hashes: Verificar si un campo existe en un hash
  def hexists?(hash_key, field)
    @redis.hexists(hash_key, field)
  end

  # Manejo de hashes: Eliminar un campo en un hash
  def hdel(hash_key, field)
    delete_key  = false
    valor       = @redis.hdel(hash_key, field)
    delete_key  = true if valor == 1
    delete_key
  end
    

end