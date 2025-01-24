# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'


puts 'Creando cuentas...'
cuentas = Cuenta.all

puts 'Creando transacciones...'
cuentas.each do |cuenta|
  5.times do
    Transaccion.create!(
      cuenta: cuenta,
      monto: Faker::Number.decimal(l_digits: 3, r_digits: 2),
      tipo: %w[credito debito].sample,
      descripcion: Faker::Commerce.product_name,
      fecha: Faker::Time.between(from: 1.year.ago, to: Time.now)
    )
  end
end
puts 'Seed completado con éxito.'




# 10.times do
#   CuentaSaldo.create!(
#     saldo: Faker::Number.decimal(l_digits: 8, r_digits: 2), # Genera un saldo aleatorio
#     cuenta_id: Faker::Number.between(from: 1, to: 100),     # Ajusta según tus IDs existentes
#     lock_version: 0                                         # Valor por defecto
#   )
# end

# 10.times do
#   Transaccion.create!(
#     fecha_operacion: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#     tarjeta_id: Faker::Finance.credit_card,
#     cuenta_id: Faker::Bank.account_number,
#     tipo_procesamiento: Faker::Lorem.word,
#     tipo_transaccion: Faker::Lorem.word,
#     cuotas: Faker::Number.between(from: 1, to: 12),
#     origen_transaccion: Faker::Lorem.word,
#     usuario_transaccion: Faker::Name.name,
#     numero_seguimiento_auditoria: Faker::Alphanumeric.alphanumeric(number: 10),
#     descripcion_comercio: Faker::Company.name,
#     fecha_expiracion: Faker::Date.forward(days: 365).to_s,
#     codigo_categoria_comercio: Faker::Lorem.word,
#     codigo_modo_entrada_transaccion: Faker::Lorem.word,
#     mti: Faker::Lorem.word,
#     codigo_procesamiento: Faker::Lorem.word,
#     numero_referencia: Faker::Alphanumeric.alphanumeric(number: 10),
#     codigo_terminal_pos: Faker::Lorem.word,
#     moneda_original: Faker::Currency.code,
#     monto_original: Faker::Commerce.price(range: 1.0..1000.0, as_string: true),
#     moneda_liquidacion: Faker::Currency.code,
#     monto_liquidacion: Faker::Commerce.price(range: 1.0..1000.0, as_string: true),
#     path_transaccion: Faker::Internet.url,
#     codigo_transaccion: Faker::Alphanumeric.alphanumeric(number: 15),
#     anio: Faker::Number.between(from: 2000, to: 2025),
#     mes: Faker::Number.between(from: 1, to: 12),
#     dia: Faker::Number.between(from: 1, to: 31),
#     hora: Faker::Number.between(from: 0, to: 23),
#     ciclo: "202412"
#   )
# end

# puts "100 registros de Transaccion generados correctamente."