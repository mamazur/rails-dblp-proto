# frozen_string_literal: true

class CreateModuleDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :module_descriptions do |t|
      t.string :name
      t.string :lecturer
      t.string :description

      t.timestamps null: false
    end
  end
end
