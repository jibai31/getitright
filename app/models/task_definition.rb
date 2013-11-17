class TaskDefinition < ActiveRecord::Base
  belongs_to :check_list_definition
  has_many :tasks, -> { order :step }
end
