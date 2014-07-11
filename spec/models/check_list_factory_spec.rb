require 'spec_helper'

describe CheckListFactory do
  let(:user) { create(:user) }
  let(:check_list_definition) { create(:check_list_definition, user: user) }

  describe "create checklist" do
    it "creates a new checklist" do
      # factory call
      check_list = CheckListFactory.new.create(check_list_definition, user)

      # verify task step
      check_list.tasks.count.should == check_list_definition.task_definitions.count
      check_list.user.should == user
    end

    it "copies tasks text instead of refering to the task definitions" do
      check_list = CheckListFactory.new.create(check_list_definition, user)
      original_task_text = check_list_definition.task_definitions.order(:step).first.text

      check_list_definition.task_definitions.update_all(text: "NEW_TEXT")

      first_task_text = check_list.tasks.order(:step).first.text
      first_task_text.should_not == "NEW_TEXT"
      first_task_text.should == original_task_text
    end
  end
end
