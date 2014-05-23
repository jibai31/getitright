class TaskDefinitionsController < ApplicationController
  before_action :set_task_definition, only: [:show, :edit, :update, :destroy]

  def index
    @task_definitions = TaskDefinition.all
  end

  def show
  end

  def new
    @task_definition = TaskDefinition.new
  end

  def edit
  end

  def create
    @task_definition = TaskDefinition.new(task_definition_params)

    respond_to do |format|
      if @task_definition.save
        format.html { redirect_to @task_definition, notice: 'Task definition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task_definition }
      else
        format.html { render action: 'new' }
        format.json { render json: @task_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task_definition.update(task_definition_params)
        format.html { redirect_to @task_definition, notice: 'Task definition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task_definition.destroy
    respond_to do |format|
      format.html { redirect_to task_definitions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_definition
      @task_definition = TaskDefinition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_definition_params
      params.require(:task_definition).permit(:check_list_definition_id, :text, :step)
    end
end
