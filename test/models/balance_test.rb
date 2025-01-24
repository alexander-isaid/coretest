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
require "test_helper"

class BalanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
