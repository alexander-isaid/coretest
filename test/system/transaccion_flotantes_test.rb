require "application_system_test_case"

class TransaccionFlotantesTest < ApplicationSystemTestCase
  setup do
    @transaccion_flotante = transaccion_flotantes(:one)
  end

  test "visiting the index" do
    visit transaccion_flotantes_url
    assert_selector "h1", text: "Transaccion flotantes"
  end

  test "should create transaccion flotante" do
    visit transaccion_flotantes_url
    click_on "New transaccion flotante"

    fill_in "Cuenta", with: @transaccion_flotante.cuenta_id
    fill_in "Descipcion", with: @transaccion_flotante.descipcion
    fill_in "Estado", with: @transaccion_flotante.estado
    fill_in "Fecha", with: @transaccion_flotante.fecha
    fill_in "Monto", with: @transaccion_flotante.monto
    fill_in "Saldo actual", with: @transaccion_flotante.saldo_actual
    fill_in "Saldo anterior", with: @transaccion_flotante.saldo_anterior
    fill_in "Tipo", with: @transaccion_flotante.tipo
    click_on "Create Transaccion flotante"

    assert_text "Transaccion flotante was successfully created"
    click_on "Back"
  end

  test "should update Transaccion flotante" do
    visit transaccion_flotante_url(@transaccion_flotante)
    click_on "Edit this transaccion flotante", match: :first

    fill_in "Cuenta", with: @transaccion_flotante.cuenta_id
    fill_in "Descipcion", with: @transaccion_flotante.descipcion
    fill_in "Estado", with: @transaccion_flotante.estado
    fill_in "Fecha", with: @transaccion_flotante.fecha.to_s
    fill_in "Monto", with: @transaccion_flotante.monto
    fill_in "Saldo actual", with: @transaccion_flotante.saldo_actual
    fill_in "Saldo anterior", with: @transaccion_flotante.saldo_anterior
    fill_in "Tipo", with: @transaccion_flotante.tipo
    click_on "Update Transaccion flotante"

    assert_text "Transaccion flotante was successfully updated"
    click_on "Back"
  end

  test "should destroy Transaccion flotante" do
    visit transaccion_flotante_url(@transaccion_flotante)
    click_on "Destroy this transaccion flotante", match: :first

    assert_text "Transaccion flotante was successfully destroyed"
  end
end
