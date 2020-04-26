# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_160_801_204_002) do
  create_table 'lecturers', force: :cascade do |t|
    t.string   'first_name'
    t.string   'family_name'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.integer  'publication_id'
  end

  add_index 'lecturers', ['publication_id'], name: 'index_lecturers_on_publication_id'

  create_table 'lecturers_module_descriptions', id: false, force: :cascade do |t|
    t.integer 'lecturer_id',           null: false
    t.integer 'module_description_id', null: false
  end

  add_index 'lecturers_module_descriptions', %w[lecturer_id module_description_id], name: 'lecturer_module'
  add_index 'lecturers_module_descriptions', %w[module_description_id lecturer_id], name: 'module_lecturer'

  create_table 'module_descriptions', force: :cascade do |t|
    t.string   'name'
    t.string   'lecturer'
    t.string   'description'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
  end

  create_table 'module_lecturer_mappings', force: :cascade do |t|
    t.integer  'module_description_id'
    t.integer  'lecturer_id'
    t.datetime 'created_at',            null: false
    t.datetime 'updated_at',            null: false
  end

  add_index 'module_lecturer_mappings', ['lecturer_id'], name: 'index_module_lecturer_mappings_on_lecturer_id'
  add_index 'module_lecturer_mappings', ['module_description_id'], name: 'index_module_lecturer_mappings_on_module_description_id'

  create_table 'publications', force: :cascade do |t|
    t.string   'dblp_id'
    t.string   'publication_description'
    t.datetime 'created_at',              null: false
    t.datetime 'updated_at',              null: false
    t.integer  'lecturer_id'
  end

  add_index 'publications', ['lecturer_id'], name: 'index_publications_on_lecturer_id'
end
