require 'spec_helper'

describe CheckListDefinitionsController do

  # This should return the minimal set of attributes required to create a valid
  # CheckListDefinition. As you add validations to CheckListDefinition, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  context "when user NOT signed in" do
    describe "GET index" do
      it "assigns all check_list_definitions as @check_list_definitions" do
        check_list_definition = CheckListDefinition.create! valid_attributes
        get :index, {}
        assigns(:check_list_definitions).should eq([check_list_definition])
      end
    end
  end

  context "when user signed in" do
    login_user

    describe "GET index" do
      it "assigns only the user's check_list_definitions as @check_list_definitions" do
        check_list_definition = create(:check_list_definition, user: @current_user)
        other_one = create(:check_list_definition, user: create(:user))
        get :index, {}
        assigns(:check_list_definitions).should eq([check_list_definition])
        assigns(:other_public_check_list_definitions).should eq([other_one])
      end
    end

    describe "GET show" do
      it "assigns the requested check_list_definition as @check_list_definition" do
        check_list_definition = CheckListDefinition.create! valid_attributes
        get :show, {:id => check_list_definition.to_param}
        assigns(:check_list_definition).should eq(check_list_definition)
      end
    end

    describe "GET new" do
      it "assigns a new check_list_definition as @check_list_definition" do
        get :new, {}
        assigns(:check_list_definition).should be_a_new(CheckListDefinition)
      end
    end

    describe "GET edit" do
      it "assigns the requested check_list_definition as @check_list_definition" do
        check_list_definition = CheckListDefinition.create! valid_attributes
        get :edit, {:id => check_list_definition.to_param}
        assigns(:check_list_definition).should eq(check_list_definition)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new CheckListDefinition" do
          expect {
            post :create, {:check_list_definition => valid_attributes}
          }.to change(CheckListDefinition, :count).by(1)
        end

        it "assigns a newly created check_list_definition as @check_list_definition" do
          post :create, {:check_list_definition => valid_attributes}
          assigns(:check_list_definition).should be_a(CheckListDefinition)
          assigns(:check_list_definition).should be_persisted
        end

        it "redirects to the list of checklists" do
          post :create, {:check_list_definition => valid_attributes}
          response.should redirect_to('/check_list_definitions')
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved check_list_definition as @check_list_definition" do
          CheckListDefinition.any_instance.stub(:save).and_return(false)
          post :create, {:check_list_definition => { "name" => "invalid value" }}
          assigns(:check_list_definition).should be_a_new(CheckListDefinition)
        end

        it "re-renders the 'new' template" do
          CheckListDefinition.any_instance.stub(:save).and_return(false)
          post :create, {:check_list_definition => { "name" => "invalid value" }}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested check_list_definition" do
          check_list_definition = CheckListDefinition.create! valid_attributes
          CheckListDefinition.any_instance.should_receive(:update).with({ "name" => "MyString" })
          put :update, {:id => check_list_definition.to_param, :check_list_definition => { "name" => "MyString" }}
        end

        it "assigns the requested check_list_definition as @check_list_definition" do
          check_list_definition = CheckListDefinition.create! valid_attributes
          put :update, {:id => check_list_definition.to_param, :check_list_definition => valid_attributes}
          assigns(:check_list_definition).should eq(check_list_definition)
        end

        it "redirects to the list of CheckLists" do
          check_list_definition = CheckListDefinition.create! valid_attributes
          put :update, {:id => check_list_definition.to_param, :check_list_definition => valid_attributes}
          response.should redirect_to('/check_list_definitions')
        end
      end

      describe "with invalid params" do
        it "assigns the check_list_definition as @check_list_definition" do
          check_list_definition = CheckListDefinition.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          CheckListDefinition.any_instance.stub(:save).and_return(false)
          put :update, {:id => check_list_definition.to_param, :check_list_definition => { "name" => "invalid value" }}
          assigns(:check_list_definition).should eq(check_list_definition)
        end

        it "re-renders the 'edit' template" do
          check_list_definition = CheckListDefinition.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          CheckListDefinition.any_instance.stub(:save).and_return(false)
          put :update, {:id => check_list_definition.to_param, :check_list_definition => { "name" => "invalid value" }}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested check_list_definition" do
        check_list_definition = CheckListDefinition.create! valid_attributes
        expect {
          delete :destroy, {:id => check_list_definition.to_param}
        }.to change(CheckListDefinition, :count).by(-1)
      end

      it "redirects to the check_list_definitions list" do
        check_list_definition = CheckListDefinition.create! valid_attributes
        delete :destroy, {:id => check_list_definition.to_param}
        response.should redirect_to(check_list_definitions_url)
      end
    end
  end
end
