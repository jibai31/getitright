require 'spec_helper'

describe "CheckListDefinitions" do
  describe "GET /check_list_definitions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get check_list_definitions_path
      response.status.should be(200)
    end
  end
end
