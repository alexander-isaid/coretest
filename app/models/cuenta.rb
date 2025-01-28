# == Schema Information
#
# Table name: cuentas
#
#  id         :bigint           not null, primary key
#  disponible :decimal(10, 2)   default(0.0), not null
#  nombre     :string
#  numero     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cuenta < ApplicationRecord
    has_one :balance
    has_many :transacciones
    has_many :transaccion_flotantes
    has_many :movimientos
    def name
        "#{nombre} - #{numero}"
    end


end
