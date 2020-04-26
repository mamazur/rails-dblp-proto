# frozen_string_literal: true

class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :lecturers, :module_descriptions do |t|
      t.index %i[lecturer_id module_description_id], name: 'lecturer_module'
      t.index %i[module_description_id lecturer_id], name: 'module_lecturer'
    end
  end
end
