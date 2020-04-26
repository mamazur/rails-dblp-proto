# frozen_string_literal: true

json.array!(@lecturers) do |lecturer|
  json.extract! lecturer, :id, :first_name, :family_name
  json.url lecturer_url(lecturer, format: :json)
end
