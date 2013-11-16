require 'spec_helper'

describe "check_lists/index" do
  before(:each) do
    assign(:check_lists, [
      stub_model(CheckList,
        :name => "Name",
        :user => nil,
        :check_list_definition => nil
      ),
      stub_model(CheckList,
        :name => "Name",
        :user => nil,
        :check_list_definition => nil
      )
    ])
  end

  it "renders a list of check_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
