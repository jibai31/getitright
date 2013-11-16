json.array!(@check_lists) do |check_list|
  json.extract! check_list, :name, :user_id, :check_list_definition_id
  json.url check_list_url(check_list, format: :json)
end
