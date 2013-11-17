class TaskDefinitionsController < ApplicationController
  before_action :set_task_definition, only: [:show, :edit, :update, :destroy]

  # GET /task_definitions
  # GET /task_definitions.json
  def index
    @task_definitions = TaskDefinition.all
  end

  # GET /task_definitions/1
  # GET /task_definitions/1.json
  def show
  end

  # GET /task_definitions/new
  def new
    @task_definition = TaskDefinition.new
  end

  # GET /task_definitions/1/edit
  def edit
  end

  # POST /task_definitions
  # POST /task_definitions.json
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

  # PATCH/PUT /task_definitions/1
  # PATCH/PUT /task_definitions/1.json
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

  # DELETE /task_definitions/1
  # DELETE /task_definitions/1.json
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
