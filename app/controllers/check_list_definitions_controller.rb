class CheckListDefinitionsController < ApplicationController
  before_action :set_check_list_definition, only: [:show, :edit, :update, :destroy]

  def index
    @check_list_definitions = CheckListDefinition.all
  end

  def show
  end

  def new
    @check_list_definition = CheckListDefinition.new
    @check_list_definition.task_definitions.build
  end

  def edit
  end

  def create
    @check_list_definition = CheckListDefinition.new(check_list_definition_params)

    respond_to do |format|
      if @check_list_definition.save
        format.html { redirect_to @check_list_definition, notice: 'Check list definition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @check_list_definition }
      else
        format.html { render action: 'new' }
        format.json { render json: @check_list_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @check_list_definition.update(check_list_definition_params)
        format.html { redirect_to @check_list_definition, notice: 'Check list definition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @check_list_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @check_list_definition.destroy
    respond_to do |format|
      format.html { redirect_to check_list_definitions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_list_definition
      @check_list_definition = CheckListDefinition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_list_definition_params
      params.require(:check_list_definition)
            .permit(:name, :description, task_definitions_attributes: [:id, :text, :step])
    end
end
