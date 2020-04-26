# frozen_string_literal: true

json.array!(@module_descriptions) do |module_description|
  json.extract! module_description, :id, :name, :lecturer, :description
  json.url module_description_url(module_description, format: :json)
end
