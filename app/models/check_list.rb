class CheckList < ActiveRecord::Base
  belongs_to :user
  belongs_to :check_list_definition
end
