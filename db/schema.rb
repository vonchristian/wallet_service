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

ActiveRecord::Schema[7.0].define(version: 2023_08_03_152131) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounting_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.boolean "contra", default: false
    t.string "account_type"
    t.uuid "financial_institution_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_type"], name: "index_accounting_accounts_on_account_type"
    t.index ["contra"], name: "index_accounting_accounts_on_contra"
    t.index ["financial_institution_id"], name: "index_accounting_accounts_on_financial_institution_id"
  end

  create_table "accounting_amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.uuid "entry_id", null: false
    t.bigint "amount_cents"
    t.string "amount_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "entry_id"], name: "index_accounting_amounts_on_account_id_and_entry_id"
    t.index ["account_id"], name: "index_accounting_amounts_on_account_id"
    t.index ["amount_type"], name: "index_accounting_amounts_on_amount_type"
    t.index ["entry_id", "account_id"], name: "index_accounting_amounts_on_entry_id_and_account_id"
    t.index ["entry_id"], name: "index_accounting_amounts_on_entry_id"
  end

  create_table "accounting_entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "reference_number", null: false
    t.string "description", null: false
    t.date "entry_date", null: false
    t.time "entry_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financial_institutions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_people_on_email", unique: true
  end

  create_table "personal_connections", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "source_person_id", null: false
    t.uuid "target_person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_person_id"], name: "index_personal_connections_on_source_person_id"
    t.index ["target_person_id"], name: "index_personal_connections_on_target_person_id"
  end

  create_table "personal_wallets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "person_id", null: false
    t.uuid "wallet_id", null: false
    t.uuid "issuer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issuer_id"], name: "index_personal_wallets_on_issuer_id"
    t.index ["person_id"], name: "index_personal_wallets_on_person_id"
    t.index ["wallet_id"], name: "index_personal_wallets_on_wallet_id"
  end

  create_table "txn_amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "txn_id", null: false
    t.string "amount_type", null: false
    t.bigint "amount_cents"
    t.uuid "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_txn_amounts_on_account_id"
    t.index ["amount_type"], name: "index_txn_amounts_on_amount_type"
    t.index ["txn_id"], name: "index_txn_amounts_on_txn_id"
  end

  create_table "txns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "reference_number", null: false
    t.string "description", null: false
    t.date "entry_date", null: false
    t.time "entry_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_date"], name: "index_txns_on_entry_date"
    t.index ["entry_time"], name: "index_txns_on_entry_time"
  end

  create_table "wallets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "account_number", null: false
    t.string "account_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "deposit_account_id", null: false
    t.index ["account_number"], name: "index_wallets_on_account_number", unique: true
    t.index ["deposit_account_id"], name: "index_wallets_on_deposit_account_id"
  end

  add_foreign_key "accounting_accounts", "financial_institutions"
  add_foreign_key "accounting_amounts", "accounting_accounts", column: "account_id"
  add_foreign_key "accounting_amounts", "accounting_entries", column: "entry_id"
  add_foreign_key "personal_connections", "people", column: "source_person_id"
  add_foreign_key "personal_connections", "people", column: "target_person_id"
  add_foreign_key "personal_wallets", "financial_institutions", column: "issuer_id"
  add_foreign_key "personal_wallets", "people"
  add_foreign_key "personal_wallets", "wallets"
  add_foreign_key "txn_amounts", "accounting_accounts", column: "account_id"
  add_foreign_key "txn_amounts", "txns"
  add_foreign_key "wallets", "accounting_accounts", column: "deposit_account_id"
end
