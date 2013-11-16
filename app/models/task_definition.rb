class TaskDefinition < ActiveRecord::Base
  belongs_to :check_list_definition
end
