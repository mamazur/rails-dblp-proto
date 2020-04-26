# frozen_string_literal: true

class AddPublicationsToLecturer < ActiveRecord::Migration
  def change
    add_reference :publications, :lecturer, index: true, foreign_key: true
  end
end
