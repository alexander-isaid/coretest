json.extract! post, :id, :titulo, :descripcion, :activo, :created_at, :updated_at
json.url post_url(post, format: :json)
