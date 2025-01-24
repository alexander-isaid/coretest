# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  activo      :boolean
#  descripcion :text
#  titulo      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Post < ApplicationRecord
end
