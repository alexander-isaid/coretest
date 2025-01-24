require "application_system_test_case"

class TransaccionesTest < ApplicationSystemTestCase
  setup do
    @transaccion = transacciones(:one)
  end

  test "visiting the index" do
    visit transacciones_url
    assert_selector "h1", text: "Transacciones"
  end

  test "should create transaccion" do
    visit transacciones_url
    click_on "New transaccion"

    fill_in "Cuenta", with: @transaccion.cuenta_id
    fill_in "Descripcion", with: @transaccion.descripcion
    fill_in "Fecha", with: @transaccion.fecha
    fill_in "Monto", with: @transaccion.monto
    fill_in "Tipo", with: @transaccion.tipo
    click_on "Create Transaccion"

    assert_text "Transaccion was successfully created"
    click_on "Back"
  end

  test "should update Transaccion" do
    visit transaccion_url(@transaccion)
    click_on "Edit this transaccion", match: :first

    fill_in "Cuenta", with: @transaccion.cuenta_id
    fill_in "Descripcion", with: @transaccion.descripcion
    fill_in "Fecha", with: @transaccion.fecha.to_s
    fill_in "Monto", with: @transaccion.monto
    fill_in "Tipo", with: @transaccion.tipo
    click_on "Update Transaccion"

    assert_text "Transaccion was successfully updated"
    click_on "Back"
  end

  test "should destroy Transaccion" do
    visit transaccion_url(@transaccion)
    click_on "Destroy this transaccion", match: :first

    assert_text "Transaccion was successfully destroyed"
  end
end
