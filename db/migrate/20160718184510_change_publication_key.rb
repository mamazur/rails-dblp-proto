# frozen_string_literal: true

class ChangePublicationKey < ActiveRecord::Migration[6.0]
  def change
    change_table :publications do |t|
      t.change :dblp_id, :string
    end
  end
end
