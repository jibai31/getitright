class CheckListFactory
  
  def create(check_list_definition,current_user)
    cl = current_user.check_lists.build
    cl.user = current_user
    cl.check_list_definition = check_list_definition
    cl.name = check_list_definition.name
    check_list_definition.task_definitions.each do |task_definition|
      t = cl.tasks.build
      t.task_definition = task_definition
      t.step = task_definition.step
      t.text = task_definition.text
      t.done = false
    end
    cl.save
    cl
  end
  
end
