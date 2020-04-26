# frozen_string_literal: true

class Publication < ActiveRecord::Base
  belongs_to :lecturer

  validates :dblp_id,
            presence: true
  def to_s
    dblp_id
  end
end
