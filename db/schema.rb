# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_01_23_210853) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balances", force: :cascade do |t|
    t.bigint "cuenta_id", null: false
    t.decimal "saldo", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "lock_version", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuenta_id"], name: "index_balances_on_cuenta_id"
  end

  create_table "cuentas", force: :cascade do |t|
    t.string "numero"
    t.string "nombre"
    t.decimal "disponible", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "titulo"
    t.text "descripcion"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transacciones", force: :cascade do |t|
    t.bigint "cuenta_id", null: false
    t.decimal "monto", precision: 10, scale: 2, default: "0.0", null: false
    t.string "tipo"
    t.string "descripcion"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "saldo_anterior", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "saldo_actual", precision: 10, scale: 2, default: "0.0", null: false
    t.string "estado"
    t.index ["cuenta_id"], name: "index_transacciones_on_cuenta_id"
  end

  add_foreign_key "balances", "cuentas"
  add_foreign_key "transacciones", "cuentas"
end
