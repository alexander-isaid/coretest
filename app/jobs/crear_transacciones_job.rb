class CrearTransaccionesJob < ApplicationJob
  queue_as :default

  def perform(cuenta, tipo)
    test = TestMovimiento.new
    if tipo =="credito_flotante"
      test.tx_creditos_flotante(cuenta)
    end
    if tipo == "creditos"
      test.tx_creditos(cuenta)
    end
    if tipo =="debitos_flotante"
      test.tx_debitos_flotante(cuenta)
    end
    if tipo == "debitos"
      test.tx_debitos(cuenta)
    end
  end
end
