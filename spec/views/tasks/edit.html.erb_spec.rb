require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :step => 1,
      :done => false,
      :task_definition => nil,
      :check_list => nil
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_step[name=?]", "task[step]"
      assert_select "input#task_done[name=?]", "task[done]"
      assert_select "input#task_task_definition[name=?]", "task[task_definition]"
      assert_select "input#task_check_list[name=?]", "task[check_list]"
    end
  end
end
