class TaskDefinition < ActiveRecord::Base
  belongs_to :check_list_definition
  has_many :tasks, -> { order :step }
  validates_presence_of [:text, :step]
end
