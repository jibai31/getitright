class CheckListDefinition < ActiveRecord::Base
  has_many :task_definitions, -> { where order: 'step ASC' }
  accepts_nested_attributes_for :task_definitions
  belongs_to :user
end
