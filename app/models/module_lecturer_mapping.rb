# frozen_string_literal: true

class ModuleLecturerMapping < ActiveRecord::Base
  belongs_to :module_description
  belongs_to :lecturer
end
