json.array!(@task_definitions) do |task_definition|
  json.extract! task_definition, :check_list_definition_id, :text
  json.url task_definition_url(task_definition, format: :json)
end
