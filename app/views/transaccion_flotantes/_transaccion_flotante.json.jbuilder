json.extract! transaccion_flotante, :id, :cuenta_id, :descripcion, :estado, :fecha, :saldo_anterior, :monto, :saldo_actual, :tipo, :created_at, :updated_at
json.url transaccion_flotante_url(transaccion_flotante, format: :json)
