require "spec_helper"

describe CheckListDefinitionsController do
  describe "routing" do

    it "routes to #index" do
      get("/check_list_definitions").should route_to("check_list_definitions#index")
    end

    it "routes to #new" do
      get("/check_list_definitions/new").should route_to("check_list_definitions#new")
    end

    it "routes to #show" do
      get("/check_list_definitions/1").should route_to("check_list_definitions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/check_list_definitions/1/edit").should route_to("check_list_definitions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/check_list_definitions").should route_to("check_list_definitions#create")
    end

    it "routes to #update" do
      put("/check_list_definitions/1").should route_to("check_list_definitions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/check_list_definitions/1").should route_to("check_list_definitions#destroy", :id => "1")
    end

  end
end
