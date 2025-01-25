require "test_helper"

class TransaccionFlotantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaccion_flotante = transaccion_flotantes(:one)
  end

  test "should get index" do
    get transaccion_flotantes_url
    assert_response :success
  end

  test "should get new" do
    get new_transaccion_flotante_url
    assert_response :success
  end

  test "should create transaccion_flotante" do
    assert_difference("TransaccionFlotante.count") do
      post transaccion_flotantes_url, params: { transaccion_flotante: { cuenta_id: @transaccion_flotante.cuenta_id, descipcion: @transaccion_flotante.descipcion, estado: @transaccion_flotante.estado, fecha: @transaccion_flotante.fecha, monto: @transaccion_flotante.monto, saldo_actual: @transaccion_flotante.saldo_actual, saldo_anterior: @transaccion_flotante.saldo_anterior, tipo: @transaccion_flotante.tipo } }
    end

    assert_redirected_to transaccion_flotante_url(TransaccionFlotante.last)
  end

  test "should show transaccion_flotante" do
    get transaccion_flotante_url(@transaccion_flotante)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaccion_flotante_url(@transaccion_flotante)
    assert_response :success
  end

  test "should update transaccion_flotante" do
    patch transaccion_flotante_url(@transaccion_flotante), params: { transaccion_flotante: { cuenta_id: @transaccion_flotante.cuenta_id, descipcion: @transaccion_flotante.descipcion, estado: @transaccion_flotante.estado, fecha: @transaccion_flotante.fecha, monto: @transaccion_flotante.monto, saldo_actual: @transaccion_flotante.saldo_actual, saldo_anterior: @transaccion_flotante.saldo_anterior, tipo: @transaccion_flotante.tipo } }
    assert_redirected_to transaccion_flotante_url(@transaccion_flotante)
  end

  test "should destroy transaccion_flotante" do
    assert_difference("TransaccionFlotante.count", -1) do
      delete transaccion_flotante_url(@transaccion_flotante)
    end

    assert_redirected_to transaccion_flotantes_url
  end
end
