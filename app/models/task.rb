class Task < ActiveRecord::Base
  belongs_to :task_definition
  belongs_to :check_list
  
  # Test "inherited from the text file"
  def text
    self.task_definition.text
  end

  def smart_text
    "#{self.task_definition.text}"
  end
end
