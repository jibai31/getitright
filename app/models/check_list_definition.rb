class CheckListDefinition < ActiveRecord::Base
  has_many :task_definitions, -> { order :step }
  accepts_nested_attributes_for :task_definitions
  belongs_to :user
  has_many :check_lists
  validates_presence_of :name

  scope :ordered, -> { order(:created_at).includes(:user) }
end
