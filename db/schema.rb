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

ActiveRecord::Schema.define(:version => 20141127132614) do

  create_table "eventos", :force => true do |t|
    t.text     "nombre"
    t.text     "fecha"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.text     "nombre"
    t.text     "tema"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "leyes", :force => true do |t|
    t.text     "nombre"
    t.text     "tema"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "localizacions", :force => true do |t|
    t.text     "comuna"
    t.text     "provincia"
    t.text     "region"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "palabra_claves", :force => true do |t|
    t.text     "palabra"
    t.boolean  "intension"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tweets", :force => true do |t|
    t.text     "mensaje_id"
    t.text     "texto"
    t.datetime "creacion_tweet"
    t.text     "recurso"
    t.integer  "usuario_id"
    t.integer  "localizacion_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "tweets_pal_claves", :force => true do |t|
    t.integer  "tweet_id"
    t.integer  "palabra_clave_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
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
  end

end
