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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141211073904) do

  create_table "invoices", force: true do |t|
    t.binary   "uuid",           limit: 16
    t.date     "date"
    t.integer  "subtotal_cents"
    t.integer  "shipping_cents"
    t.integer  "tax_cents"
    t.integer  "total_cents"
    t.integer  "amount_due"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.binary   "uuid",        limit: 16
    t.integer  "invoice_id"
    t.text     "description"
    t.integer  "qty"
    t.integer  "price_cents"
    t.integer  "total_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete"
    t.string   "priority"
  end

end
