require 'spec_helper'

describe TaskDefinitionsController do
  login_user

  let(:check_list_definition) { create(:check_list_definition, user: @current_user) }
  let(:valid_attributes) { { text: "TEXT", step: 0, "check_list_definition" => check_list_definition } }

  describe "GET index" do
    it "assigns all task_definitions as @task_definitions" do
      task_definition = TaskDefinition.create! valid_attributes
      get :index, {}
      assigns(:task_definitions).should eq([task_definition])
    end
  end

  describe "GET show" do
    it "assigns the requested task_definition as @task_definition" do
      task_definition = TaskDefinition.create! valid_attributes
      get :show, {:id => task_definition.to_param}
      assigns(:task_definition).should eq(task_definition)
    end
  end

  describe "GET new" do
    it "assigns a new task_definition as @task_definition" do
      get :new, {}
      assigns(:task_definition).should be_a_new(TaskDefinition)
    end
  end

  describe "GET edit" do
    it "assigns the requested task_definition as @task_definition" do
      task_definition = TaskDefinition.create! valid_attributes
      get :edit, {:id => task_definition.to_param}
      assigns(:task_definition).should eq(task_definition)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TaskDefinition" do
        expect {
          post :create, {:task_definition => valid_attributes}
        }.to change(TaskDefinition, :count).by(1)
      end

      it "assigns a newly created task_definition as @task_definition" do
        post :create, {:task_definition => valid_attributes}
        assigns(:task_definition).should be_a(TaskDefinition)
        assigns(:task_definition).should be_persisted
      end

      it "redirects to the created task_definition" do
        post :create, {:task_definition => valid_attributes}
        response.should redirect_to(TaskDefinition.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task_definition as @task_definition" do
        # Trigger the behavior that occurs when invalid params are submitted
        TaskDefinition.any_instance.stub(:save).and_return(false)
        post :create, {:task_definition => { "check_list_definition" => "invalid value" }}
        assigns(:task_definition).should be_a_new(TaskDefinition)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TaskDefinition.any_instance.stub(:save).and_return(false)
        post :create, {:task_definition => { "check_list_definition" => "invalid value" }}
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
        TaskDefinition.any_instance.should_receive(:update).with({ "text" => "NEW" })
        put :update, {:id => task_definition.to_param, :task_definition => { "text" => "NEW" }}
      end

      it "assigns the requested task_definition as @task_definition" do
        task_definition = TaskDefinition.create! valid_attributes
        put :update, {:id => task_definition.to_param, :task_definition => valid_attributes}
        assigns(:task_definition).should eq(task_definition)
      end

      it "redirects to the task_definition" do
        task_definition = TaskDefinition.create! valid_attributes
        put :update, {:id => task_definition.to_param, :task_definition => valid_attributes}
        response.should redirect_to(task_definition)
      end
    end

    describe "with invalid params" do
      it "assigns the task_definition as @task_definition" do
        task_definition = TaskDefinition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TaskDefinition.any_instance.stub(:save).and_return(false)
        put :update, {:id => task_definition.to_param, :task_definition => { "check_list_definition" => "invalid value" }}
        assigns(:task_definition).should eq(task_definition)
      end

      it "re-renders the 'edit' template" do
        task_definition = TaskDefinition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TaskDefinition.any_instance.stub(:save).and_return(false)
        put :update, {:id => task_definition.to_param, :task_definition => { "check_list_definition" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task_definition" do
      task_definition = TaskDefinition.create! valid_attributes
      expect {
        delete :destroy, {:id => task_definition.to_param}
      }.to change(TaskDefinition, :count).by(-1)
    end

    it "redirects to the task_definitions list" do
      task_definition = TaskDefinition.create! valid_attributes
      delete :destroy, {:id => task_definition.to_param}
      response.should redirect_to(task_definitions_url)
    end
  end

end
