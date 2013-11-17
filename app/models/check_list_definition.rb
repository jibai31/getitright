class CheckListDefinition < ActiveRecord::Base
  has_many :task_definitions, -> { order :step }
  accepts_nested_attributes_for :task_definitions
  belongs_to :user
  has_many :check_lists
end
