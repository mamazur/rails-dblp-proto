# frozen_string_literal: true

class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.integer :dblp_id
      t.string :publication_description

      t.timestamps null: false
    end
  end
end
