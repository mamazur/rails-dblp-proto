# frozen_string_literal: true

json.array!(@publications) do |publication|
  json.extract! publication, :id, :dblp_id, :publication_description
  json.url publication_url(publication, format: :json)
end
