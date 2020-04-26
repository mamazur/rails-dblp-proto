# frozen_string_literal: true

class CreateModuleLecturerMappings < ActiveRecord::Migration[6.0]
  def change
    create_table :module_lecturer_mappings do |t|
      t.references :module_description, index: true, foreign_key: true
      t.references :lecturer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
