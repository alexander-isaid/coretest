require "test_helper"

class TransaccionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaccion = transacciones(:one)
  end

  test "should get index" do
    get transacciones_url
    assert_response :success
  end

  test "should get new" do
    get new_transaccion_url
    assert_response :success
  end

  test "should create transaccion" do
    assert_difference("Transaccion.count") do
      post transacciones_url, params: { transaccion: { cuenta_id: @transaccion.cuenta_id, descripcion: @transaccion.descripcion, fecha: @transaccion.fecha, monto: @transaccion.monto, tipo: @transaccion.tipo } }
    end

    assert_redirected_to transaccion_url(Transaccion.last)
  end

  test "should show transaccion" do
    get transaccion_url(@transaccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaccion_url(@transaccion)
    assert_response :success
  end

  test "should update transaccion" do
    patch transaccion_url(@transaccion), params: { transaccion: { cuenta_id: @transaccion.cuenta_id, descripcion: @transaccion.descripcion, fecha: @transaccion.fecha, monto: @transaccion.monto, tipo: @transaccion.tipo } }
    assert_redirected_to transaccion_url(@transaccion)
  end

  test "should destroy transaccion" do
    assert_difference("Transaccion.count", -1) do
      delete transaccion_url(@transaccion)
    end

    assert_redirected_to transacciones_url
  end
end
