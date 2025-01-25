require "application_system_test_case"

class MovimientosTest < ApplicationSystemTestCase
  setup do
    @movimiento = movimientos(:one)
  end

  test "visiting the index" do
    visit movimientos_url
    assert_selector "h1", text: "Movimientos"
  end

  test "should create movimiento" do
    visit movimientos_url
    click_on "New movimiento"

    fill_in "Cuenta", with: @movimiento.cuenta_id
    fill_in "Monto", with: @movimiento.monto
    fill_in "Monto flotante", with: @movimiento.monto_flotante
    fill_in "Saldo actual", with: @movimiento.saldo_actual
    fill_in "Saldo anterior", with: @movimiento.saldo_anterior
    fill_in "Transaccion", with: @movimiento.transaccion_id
    fill_in "Transaccion type", with: @movimiento.transaccion_type
    click_on "Create Movimiento"

    assert_text "Movimiento was successfully created"
    click_on "Back"
  end

  test "should update Movimiento" do
    visit movimiento_url(@movimiento)
    click_on "Edit this movimiento", match: :first

    fill_in "Cuenta", with: @movimiento.cuenta_id
    fill_in "Monto", with: @movimiento.monto
    fill_in "Monto flotante", with: @movimiento.monto_flotante
    fill_in "Saldo actual", with: @movimiento.saldo_actual
    fill_in "Saldo anterior", with: @movimiento.saldo_anterior
    fill_in "Transaccion", with: @movimiento.transaccion_id
    fill_in "Transaccion type", with: @movimiento.transaccion_type
    click_on "Update Movimiento"

    assert_text "Movimiento was successfully updated"
    click_on "Back"
  end

  test "should destroy Movimiento" do
    visit movimiento_url(@movimiento)
    click_on "Destroy this movimiento", match: :first

    assert_text "Movimiento was successfully destroyed"
  end
end
