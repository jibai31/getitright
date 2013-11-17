json.array!(@tasks) do |task|
  json.extract! task, :step, :done, :task_definition_id, :check_list_id
  json.url task_url(task, format: :json)
end
