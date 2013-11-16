require 'spec_helper'

describe "check_lists/new" do
  before(:each) do
    assign(:check_list, stub_model(CheckList,
      :name => "MyString",
      :user => nil,
      :check_list_definition => nil
    ).as_new_record)
  end

  it "renders new check_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", check_lists_path, "post" do
      assert_select "input#check_list_name[name=?]", "check_list[name]"
      assert_select "input#check_list_user[name=?]", "check_list[user]"
      assert_select "input#check_list_check_list_definition[name=?]", "check_list[check_list_definition]"
    end
  end
end
