class TestColas


    def self.encolar

        3000.times.each do |numero|
            puts "Encolando transaccion numero: #{numero}"
            test = TestColas.new
            cuenta = 1
            if numero <= 1000
                puts "Enviando a la cuenta: #{cuenta}"
                test.credito(cuenta)
                test.debitos(cuenta)
                test.credito_flotante(cuenta)
                test.debitos_flotante(cuenta)    
            end
            if numero > 1000 && numero <= 2000
                cuenta = 2
                puts "Enviando a la cuenta: #{cuenta}"
                test.credito(cuenta)
                test.debitos(cuenta)
                test.credito_flotante(cuenta)
                test.debitos_flotante(cuenta)
            end

            if numero > 2000 && numero <= 3000
                cuenta = 3
                puts "Enviando a la cuenta: #{cuenta}"
                test.credito(cuenta)
                test.debitos(cuenta)
                test.credito_flotante(cuenta)
                test.debitos_flotante(cuenta)
            end
        end
    end


    def credito(cuenta)
        CrearTransaccionesJob.perform_later(cuenta, "creditos")
    end

    def credito_flotante(cuenta)
        CrearTransaccionesJob.perform_later(cuenta, "credito_flotante")
    end
    def debitos(cuenta)
        CrearTransaccionesJob.perform_later(cuenta, "debitos")
    end
    def debitos_flotante(cuenta)
        CrearTransaccionesJob.perform_later(cuenta, "debitos_flotante")
    end
end