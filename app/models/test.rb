class Test
     def initialize
        Balance.limpiar(1)
     end

    def tx_credito
        hilos = []
        100.times do |numero|
            hilos << Thread.new do
                puts "Ejecutando hilo #{numero}"
                cuenta = Cuenta.find(1)
                puts " hilo #{numero} Cuenta: #{cuenta.name}"
                puts " hilo #{numero} Balance saldo: #{cuenta.balance.saldo.to_f} "
                tx_monto = 100

                puts " hilo #{numero} Acreditando : #{tx_monto}"
                Transaccion.create!(
                    cuenta_id: cuenta.id,
                    monto: tx_monto,
                    tipo: "Credito",
                    descripcion: Faker::Commerce.product_name,
                    fecha: Faker::Time.between(from: 1.year.ago, to: Time.now)
                )
                puts "hilo #{numero} saldo balance #{cuenta.balance.saldo}"
            end
        end
       hilos.each(&:join)
    end


    def tx_debito

        hilos = []
        100.times do |numero|
            hilos << Thread.new do
                puts "Ejecutando hilo #{numero}"
                cuenta = Cuenta.find(1)
                puts " hilo #{numero} Cuenta: #{cuenta.name}"
                puts " hilo #{numero} Balance saldo: #{cuenta.balance.saldo.to_f} "
                tx_monto = 100

                puts " hilo #{numero} Acreditando : #{tx_monto}"
                Transaccion.create!(
                    cuenta_id: cuenta.id,
                    monto: tx_monto,
                    tipo: "Debito",
                    descripcion: Faker::Commerce.product_name,
                    fecha: Faker::Time.between(from: 1.year.ago, to: Time.now)
                )
                puts "hilo #{numero} saldo balance #{cuenta.balance.saldo}"
            end
        end
        hilos.each(&:join)

    end 


    def tx_credito_debito
        transacciones = [
            {
                tipo: "Credito",
                monto: 100
            },
            {
                tipo: "Debito",
                monto: 25
            },
            {
                tipo: "Debito",
                monto: 25
            },
            {
                tipo: "Debito",
                monto: 50
            },
        ]
        hilos = []

        transacciones.each_with_index do |transaccion, index|
            hilos << Thread.new do
                puts "Ejecutando hilo #{index}"
                cuenta = Cuenta.find(1)
                puts " hilo #{index} Balance saldo: #{cuenta.balance.saldo.to_f} "
                puts " hilo #{index} Operacion: #{transaccion[:tipo]}"
                puts " hilo #{index} Monto: #{transaccion[:monto]}"
                transaccion = Transaccion.new(
                    cuenta_id: cuenta.id,
                    monto: transaccion[:monto],
                    tipo: transaccion[:tipo],
                    descripcion: Faker::Commerce.product_name,
                    fecha: Faker::Time.between(from: 1.year.ago, to: Time.now)
                )

                if transaccion.save
                    puts "Transaccion en el hilo #{index} reistrada"
                else
                    puts "Transaccion en el hilo #{index} con errores #{transaccion.errors.full_messages}"
                end

                puts "hilo #{index} saldo balance #{cuenta.balance.saldo}"
            end
        end
        hilos.each(&:join)


    end


end