require 'spec_helper'

describe "check_list_definitions/show" do
  before(:each) do
    @check_list_definition = assign(:check_list_definition, stub_model(CheckListDefinition,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
  end
end
