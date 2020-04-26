# frozen_string_literal: true

class ModuleDescription < ActiveRecord::Base
  has_many :module_lecturer_mappings
  # has_many :lecturers, through: :module_lecturer_mappings
  has_and_belongs_to_many :lecturers
end
