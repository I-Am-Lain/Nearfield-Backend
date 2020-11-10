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

ActiveRecord::Schema.define(version: 2020_11_10_223451) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "satellites", force: :cascade do |t|
    t.string "name"
    t.integer "color"
    t.string "satellite_number"
    t.string "international_designator"
    t.string "owner"
    t.integer "category_id"
    t.string "mission"
    t.string "launch_date"
    t.string "launch_site"
    t.string "period"
    t.string "perigree"
    t.string "apogee"
    t.string "inclination"
    t.float "x_coor"
    t.float "y_coor"
    t.float "z_coor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
