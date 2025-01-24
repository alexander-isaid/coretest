# == Schema Information
#
# Table name: transacciones
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
#  index_transacciones_on_cuenta_id  (cuenta_id)
#
# Foreign Keys
#
#  fk_rails_...  (cuenta_id => cuentas.id)
#
require "test_helper"

class TransaccionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
