class TestMovimiento
    def initialize
    end

    def tx_creditos(cuenta)
        tx_monto  = 1
        cuenta = Cuenta.find(cuenta)
        tx_tipo = "Credito" #["Credito", "Debito"].sample
        Transaccion.create!(
            cuenta_id: cuenta.id,
            monto: tx_monto,
            tipo: tx_tipo,
            descripcion: Faker::Commerce.product_name,
            fecha: Faker::Time.between(from: 1.year.ago, to: Time.now)
        )
    end

    def tx_creditos_flotante(cuenta)
        tx_monto  = 1
        cuenta = Cuenta.find(cuenta)
        tx_tipo = "Credito" #["Credito", "Debito"].sample
        TransaccionFlotante.create!(
            cuenta_id: cuenta.id,
            monto: tx_monto,
            tipo: tx_tipo,
            descripcion: Faker::Commerce.product_name,
            fecha: Faker::Time.between(from: 1.year.ago, to: Time.now)
        )
    end

    def tx_debitos(cuenta)
        tx_monto  = 1
        cuenta = Cuenta.find(cuenta)
        tx_tipo = "Debito" #["Credito", "Debito"].sample
        Transaccion.create!(
            cuenta_id: cuenta.id,
            monto: tx_monto,
            tipo: tx_tipo,
            descripcion: Faker::Commerce.product_name,
            fecha: Faker::Time.between(from: 1.year.ago, to: Time.now)
        )
    end

    def tx_debitos_flotante(cuenta)
        tx_monto  = 1
        cuenta = Cuenta.find(cuenta)
        tx_tipo = "Debito" #["Credito", "Debito"].sample
        TransaccionFlotante.create!(
            cuenta_id: cuenta.id,
            monto: tx_monto,
            tipo: tx_tipo,
            descripcion: Faker::Commerce.product_name,
            fecha: Faker::Time.between(from: 1.year.ago, to: Time.now)
        )
    end



    def tx_flotante
        hilos = []
        10.times.each do |numero|
            hilos << Thread.new do 
                tx_monto  = 100
                cuenta = Cuenta.find(1)
                tx_tipo = "Credito" #["Credito", "Debito"].sample
                TransaccionFlotante.create!(
                    cuenta_id: cuenta.id,
                    monto: tx_monto,
                    tipo: tx_tipo,
                    descripcion: Faker::Commerce.product_name,
                    fecha: Faker::Time.between(from: 1.year.ago, to: Time.now)
                )
            end 
        end
        hilos.each(&:join)
    end

    def tx_firmes
        hilos = []
        10.times.each do |numero|
            tx_monto  = 100
            cuenta = Cuenta.find(1)
            tx_tipo = "Credito" #["Credito", "Debito"].sample
            Transaccion.create!(
                cuenta_id: cuenta.id,
                monto: tx_monto,
                tipo: tx_tipo,
                descripcion: Faker::Commerce.product_name,
                fecha: Faker::Time.between(from: 1.year.ago, to: Time.now)
            )
        end
        hilos.each(&:join)
    end


end