json.extract! movimiento, :id, :transaccion_id, :transaccion_type, :cuenta_id, :monto_flotante, :monto, :saldo_anterior, :saldo_actual, :created_at, :updated_at
json.url movimiento_url(movimiento, format: :json)
