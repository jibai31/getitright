class Task < ActiveRecord::Base
  belongs_to :task_definition
  belongs_to :check_list
end
