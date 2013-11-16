json.array!(@check_list_definitions) do |check_list_definition|
  json.extract! check_list_definition, :name, :description
  json.url check_list_definition_url(check_list_definition, format: :json)
end
