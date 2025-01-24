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
require "test_helper"

class CuentaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
