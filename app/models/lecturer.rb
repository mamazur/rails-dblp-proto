# frozen_string_literal: true

class Lecturer < ActiveRecord::Base
  has_many :module_lecturer_mappings
  # has_many :module_descriptions, through: :module_lecturer_mappings
  has_and_belongs_to_many :module_descriptions
  has_many :publications, dependent: :destroy
  accepts_nested_attributes_for :publications
  validates :family_name,
            presence: true
  def to_s
    family_name
  end
end
