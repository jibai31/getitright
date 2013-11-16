require 'spec_helper'

describe "check_lists/show" do
  before(:each) do
    @check_list = assign(:check_list, stub_model(CheckList,
      :name => "Name",
      :user => nil,
      :check_list_definition => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
