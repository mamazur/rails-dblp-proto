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

ActiveRecord::Schema.define(version: 2016_08_01_204002) do

  create_table "lecturers", force: :cascade do |t|
    t.string "first_name"
    t.string "family_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lecturers_module_descriptions", id: false, force: :cascade do |t|
    t.integer "lecturer_id", null: false
    t.integer "module_description_id", null: false
    t.index ["lecturer_id", "module_description_id"], name: "lecturer_module"
    t.index ["module_description_id", "lecturer_id"], name: "module_lecturer"
  end

  create_table "module_descriptions", force: :cascade do |t|
    t.string "name"
    t.string "lecturer"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "module_lecturer_mappings", force: :cascade do |t|
    t.integer "module_description_id"
    t.integer "lecturer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lecturer_id"], name: "index_module_lecturer_mappings_on_lecturer_id"
    t.index ["module_description_id"], name: "index_module_lecturer_mappings_on_module_description_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "dblp_id"
    t.string "publication_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lecturer_id"
    t.index ["lecturer_id"], name: "index_publications_on_lecturer_id"
  end

  add_foreign_key "module_lecturer_mappings", "lecturers"
  add_foreign_key "module_lecturer_mappings", "module_descriptions"
  add_foreign_key "publications", "lecturers"
end
