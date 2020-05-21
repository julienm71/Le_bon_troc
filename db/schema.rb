# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_01_095415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annonces", force: :cascade do |t|
    t.string "titre"
    t.string "contre"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.string "description"
    t.boolean "autrepropositions"
    t.string "raison"
    t.string "photo"
    t.integer "typeechange"
    t.string "photo2"
    t.string "photo3"
    t.index ["user_id"], name: "index_annonces_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "echanges", force: :cascade do |t|
    t.integer "demandeur_id"
    t.integer "proprietaire_id"
    t.integer "annonce_id"
    t.boolean "proprietaire_accept", default: false
    t.integer "typeechange", default: 0
    t.string "objetdemandeur_photo1"
    t.string "objetdemandeur_photo2", default: "none"
    t.string "objetdemandeur_photo3", default: "none"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "objetdemandeur_titre"
    t.string "status", default: "en_attente"
    t.boolean "conflit", default: false
    t.string "raison_conflit"
    t.string "status_conflit", default: "aucun_conflit"
    t.string "objetdemandeur_desc", default: ""
    t.boolean "status_proprietaire", default: false
    t.boolean "status_demandeur", default: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pseudo"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "ville"
    t.integer "cp"
    t.string "pays"
    t.string "adresse"
    t.string "region"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
