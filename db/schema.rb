# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130109195114) do

  create_table "categoria", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "tipo_reporte"
    t.decimal  "entradas"
    t.decimal  "salidas"
    t.decimal  "ventas"
  end

  create_table "cliente_creditos", :force => true do |t|
    t.string   "nombre"
    t.text     "direccion"
    t.string   "empresa"
    t.integer  "limite_credito"
    t.integer  "limite_dias"
    t.string   "referencia_1"
    t.string   "telefono_ref_1"
    t.string   "celular_ref_1"
    t.string   "referencia_2"
    t.string   "telefono_ref_2"
    t.string   "celular_ref_2"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "entrada_productos", :force => true do |t|
    t.date     "fecha"
    t.integer  "producto_id"
    t.integer  "proveedor_id"
    t.float    "cantidad"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "factura_cheques", :force => true do |t|
    t.date     "fecha"
    t.integer  "numero"
    t.string   "cliente"
    t.string   "direccion"
    t.string   "numero_cheque"
    t.string   "banco"
    t.boolean  "anulada"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "factura_creditos", :force => true do |t|
    t.date     "fecha"
    t.integer  "numero"
    t.integer  "cliente_credito_id"
    t.string   "estado"
    t.boolean  "anulada"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "factura_efectivos", :force => true do |t|
    t.date     "fecha"
    t.integer  "numero"
    t.string   "cliente"
    t.string   "direccion"
    t.boolean  "anulada"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "factura_tarjeta", :force => true do |t|
    t.date     "fecha"
    t.integer  "numero"
    t.string   "cliente"
    t.string   "direccion"
    t.boolean  "anulada"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "marcas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pago_cheques", :force => true do |t|
    t.integer  "factura_credito_id"
    t.date     "fecha"
    t.integer  "numero"
    t.boolean  "anulada"
    t.float    "monto"
    t.string   "banco"
    t.string   "numero_cheque"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "pago_efectivos", :force => true do |t|
    t.integer  "factura_credito_id"
    t.date     "fecha"
    t.integer  "numero"
    t.boolean  "anulada"
    t.float    "monto"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "pago_tarjeta", :force => true do |t|
    t.integer  "factura_credito_id"
    t.date     "fecha"
    t.integer  "numero"
    t.boolean  "anulada"
    t.float    "monto"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "producto_factura_cheques", :force => true do |t|
    t.integer  "producto_id"
    t.float    "cantidad"
    t.float    "precio"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "factura_cheque_id"
  end

  create_table "producto_factura_creditos", :force => true do |t|
    t.integer  "producto_id"
    t.float    "cantidad"
    t.float    "precio"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "factura_credito_id"
  end

  create_table "producto_factura_efectivos", :force => true do |t|
    t.integer  "producto_id"
    t.float    "cantidad"
    t.float    "precio"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "factura_efectivo_id"
  end

  create_table "producto_factura_tarjeta", :force => true do |t|
    t.integer  "producto_id"
    t.float    "cantidad"
    t.float    "precio"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "factura_tarjetum_id"
  end

  create_table "productos", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "marca_id"
    t.float    "precio_maximo"
    t.float    "precio_minimo"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "categorium_id"
    t.float    "existencias"
    t.float    "precio_costo"
    t.float    "cantidad_galones"
  end

  create_table "proveedors", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "contacto_1"
    t.string   "telefono_1"
    t.string   "contacto_2"
    t.string   "telefono_2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "salida_producto_mal_estados", :force => true do |t|
    t.date     "fecha"
    t.integer  "producto_id"
    t.float    "cantidad"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "transferencia_interna_productos", :force => true do |t|
    t.date     "fecha"
    t.integer  "producto_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.float    "cantidad_galones"
    t.float    "cantidad"
    t.integer  "categorium_id"
  end

  create_table "users", :force => true do |t|
    t.string   "usuario"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
