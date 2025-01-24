json.extract! transaccion, :id, :cuenta_id, :monto, :tipo, :descripcion, :fecha, :created_at, :updated_at
json.url transaccion_url(transaccion, format: :json)
