class CheckList < ActiveRecord::Base

  include AASM


  aasm column: :status do
    state :started, initial: true
    state :completed
    state :canceled
    state :closed

    event :close do
      transitions from: [:completed, :canceled], to: :closed
    end

    event :cancel do
      transitions from: :started, to: :canceled
    end

    event :complete do
      transitions from: :started, to: :completed
    end
  end

  belongs_to :user
  belongs_to :check_list_definition
  has_many :tasks, -> { order 'step ASC' }

  accepts_nested_attributes_for :tasks

  delegate :description, to: :check_list_definition

end
