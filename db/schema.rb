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

ActiveRecord::Schema.define(:version => 20141215010216) do

  create_table "busquedas", :force => true do |t|
    t.text    "palabra"
    t.text    "intension"
    t.integer "evento_id"
    t.integer "leye_id"
    t.integer "iniciativa_id"
  end

  create_table "comunas", :force => true do |t|
    t.text    "comuna_nombre"
    t.integer "provincium_id"
  end

  create_table "eventos", :force => true do |t|
    t.text "evento_nombre"
    t.text "fecha"
  end

  create_table "hashtags", :force => true do |t|
    t.text     "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hashtags_tweets", :force => true do |t|
    t.integer "tweet_id"
    t.integer "hashtag_id"
  end

  create_table "iniciativas", :force => true do |t|
    t.text "iniciativa_nombre"
    t.text "iniciativa_tema"
  end

  create_table "leyes", :force => true do |t|
    t.text "leyes_nombre"
    t.text "leyes_tema"
  end

  create_table "localizacions", :force => true do |t|
    t.text     "latitud"
    t.text     "longitud"
    t.text     "lugar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "provincia", :force => true do |t|
    t.text    "provincia_nombre"
    t.integer "region_id"
  end

  create_table "regions", :force => true do |t|
    t.text "region_nombre"
  end

  create_table "tweets", :force => true do |t|
    t.text     "mensaje_id"
    t.text     "texto"
    t.datetime "creacion_tweet"
    t.text     "recurso"
    t.integer  "usuario_id"
    t.integer  "busqueda_id"
    t.integer  "localizacion_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.text     "cuenta_id"
    t.text     "nombre"
    t.text     "nick"
    t.text     "descripcion"
    t.datetime "creacion_usuario"
    t.integer  "contador_seguidores"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "comuna_id"
  end

end
