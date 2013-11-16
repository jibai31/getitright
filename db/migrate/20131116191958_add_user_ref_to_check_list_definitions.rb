class AddUserRefToCheckListDefinitions < ActiveRecord::Migration
  def change
    add_reference :check_list_definitions, :user, index: true
  end
end
  