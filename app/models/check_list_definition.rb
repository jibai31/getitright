class CheckListDefinition < ActiveRecord::Base
  belongs_to :user
  has_many :check_lists
end
