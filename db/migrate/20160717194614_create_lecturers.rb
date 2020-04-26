# frozen_string_literal: true

class CreateLecturers < ActiveRecord::Migration[6.0]
  def change
    create_table :lecturers do |t|
      t.string :first_name
      t.string :family_name

      t.timestamps null: false
    end
  end
end
