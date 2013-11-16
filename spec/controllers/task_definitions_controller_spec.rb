require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TaskDefinitionsController do

  # This should return the minimal set of attributes required to create a valid
  # TaskDefinition. As you add validations to TaskDefinition, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "check_list_definition" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TaskDefinitionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all task_definitions as @task_definitions" do
      task_definition = TaskDefinition.create! valid_attributes
      get :index, {}, valid_session
      assigns(:task_definitions).should eq([task_definition])
    end
  end

  describe "GET show" do
    it "assigns the requested task_definition as @task_definition" do
      task_definition = TaskDefinition.create! valid_attributes
      get :show, {:id => task_definition.to_param}, valid_session
      assigns(:task_definition).should eq(task_definition)
    end
  end

  describe "GET new" do
    it "assigns a new task_definition as @task_definition" do
      get :new, {}, valid_session
      assigns(:task_definition).should be_a_new(TaskDefinition)
    end
  end

  describe "GET edit" do
    it "assigns the requested task_definition as @task_definition" do
      task_definition = TaskDefinition.create! valid_attributes
      get :edit, {:id => task_definition.to_param}, valid_session
      assigns(:task_definition).should eq(task_definition)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TaskDefinition" do
        expect {
          post :create, {:task_definition => valid_attributes}, valid_session
        }.to change(TaskDefinition, :count).by(1)
      end

      it "assigns a newly created task_definition as @task_definition" do
        post :create, {:task_definition => valid_attributes}, valid_session
        assigns(:task_definition).should be_a(TaskDefinition)
        assigns(:task_definition).should be_persisted
      end

      it "redirects to the created task_definition" do
        post :create, {:task_definition => valid_attributes}, valid_session
        response.should redirect_to(TaskDefinition.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task_definition as @task_definition" do
        # Trigger the behavior that occurs when invalid params are submitted
        TaskDefinition.any_instance.stub(:save).and_return(false)
        post :create, {:task_definition => { "check_list_definition" => "invalid value" }}, valid_session
        assigns(:task_definition).should be_a_new(TaskDefinition)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TaskDefinition.any_instance.stub(:save).and_return(false)
        post :create, {:task_definition => { "check_list_definition" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested task_definition" do
        task_definition = TaskDefinition.create! valid_attributes
        # Assuming there are no other task_definitions in the database, this
        # specifies that the TaskDefinition created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TaskDefinition.any_instance.should_receive(:update).with({ "check_list_definition" => "" })
        put :update, {:id => task_definition.to_param, :task_definition => { "check_list_definition" => "" }}, valid_session
      end

      it "assigns the requested task_definition as @task_definition" do
        task_definition = TaskDefinition.create! valid_attributes
        put :update, {:id => task_definition.to_param, :task_definition => valid_attributes}, valid_session
        assigns(:task_definition).should eq(task_definition)
      end

      it "redirects to the task_definition" do
        task_definition = TaskDefinition.create! valid_attributes
        put :update, {:id => task_definition.to_param, :task_definition => valid_attributes}, valid_session
        response.should redirect_to(task_definition)
      end
    end

    describe "with invalid params" do
      it "assigns the task_definition as @task_definition" do
        task_definition = TaskDefinition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TaskDefinition.any_instance.stub(:save).and_return(false)
        put :update, {:id => task_definition.to_param, :task_definition => { "check_list_definition" => "invalid value" }}, valid_session
        assigns(:task_definition).should eq(task_definition)
      end

      it "re-renders the 'edit' template" do
        task_definition = TaskDefinition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TaskDefinition.any_instance.stub(:save).and_return(false)
        put :update, {:id => task_definition.to_param, :task_definition => { "check_list_definition" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task_definition" do
      task_definition = TaskDefinition.create! valid_attributes
      expect {
        delete :destroy, {:id => task_definition.to_param}, valid_session
      }.to change(TaskDefinition, :count).by(-1)
    end

    it "redirects to the task_definitions list" do
      task_definition = TaskDefinition.create! valid_attributes
      delete :destroy, {:id => task_definition.to_param}, valid_session
      response.should redirect_to(task_definitions_url)
    end
  end

end