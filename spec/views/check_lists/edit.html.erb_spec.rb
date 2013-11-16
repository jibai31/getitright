require 'spec_helper'

describe "check_lists/edit" do
  before(:each) do
    @check_list = assign(:check_list, stub_model(CheckList,
      :name => "MyString",
      :user => nil,
      :check_list_definition => nil
    ))
  end

  it "renders the edit check_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", check_list_path(@check_list), "post" do
      assert_select "input#check_list_name[name=?]", "check_list[name]"
      assert_select "input#check_list_user[name=?]", "check_list[user]"
      assert_select "input#check_list_check_list_definition[name=?]", "check_list[check_list_definition]"
    end
  end
end
