require 'spec_helper'

describe CheckListFactory do

  describe "create checklist" do
  	it "creates a new checklist" do
  	  user = create(:user)
  	  check_list_definition = create(:check_list_definition, user: user)

  	  # factory call
  	  check_list = CheckListFactory.new.create(check_list_definition, user)

  	  # verify task step
  	  check_list.tasks.count.should == check_list_definition.task_definitions.count
      check_list.user.should == user
  	end

    
  end
end