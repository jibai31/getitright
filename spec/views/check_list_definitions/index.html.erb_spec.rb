require 'spec_helper'

describe "check_list_definitions/index" do
  before(:each) do
    assign(:check_list_definitions, [
      stub_model(CheckListDefinition,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(CheckListDefinition,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of check_list_definitions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
