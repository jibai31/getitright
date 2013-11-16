require 'spec_helper'

describe "check_list_definitions/edit" do
  before(:each) do
    @check_list_definition = assign(:check_list_definition, stub_model(CheckListDefinition,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit check_list_definition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", check_list_definition_path(@check_list_definition), "post" do
      assert_select "input#check_list_definition_name[name=?]", "check_list_definition[name]"
      assert_select "input#check_list_definition_description[name=?]", "check_list_definition[description]"
    end
  end
end
