class Task < ActiveRecord::Base
  belongs_to :task_definition
  belongs_to :check_list
  
  delegate :text, to: :task_definition

  def smart_text
    "#{self.task_definition.text}"
  end
end
