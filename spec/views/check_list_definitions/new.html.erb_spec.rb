require 'spec_helper'

describe "check_list_definitions/new" do
  before(:each) do
    assign(:check_list_definition, stub_model(CheckListDefinition,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new check_list_definition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", check_list_definitions_path, "post" do
      assert_select "input#check_list_definition_name[name=?]", "check_list_definition[name]"
      assert_select "input#check_list_definition_description[name=?]", "check_list_definition[description]"
    end
  end
end
