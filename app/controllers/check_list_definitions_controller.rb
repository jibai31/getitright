class CheckListDefinitionsController < ApplicationController
  before_action :set_check_list_definition, only: [:show, :edit, :update, :destroy, :start]

  def index
    if user_signed_in?
      check_lists = CheckListDefinition.ordered
      @check_list_definitions = current_user.check_list_definitions.ordered
      @other_public_check_list_definitions = CheckListDefinition.ordered.where("user_id <> ?", current_user)
    else
      @check_list_definitions = CheckListDefinition.ordered
    end
  end

  def show
  end

  def new
    @check_list_definition = current_user.check_list_definitions.build
    @check_list_definition.task_definitions.build
  end

  def edit
  end

  def create
    @check_list_definition = current_user.check_list_definitions.build(check_list_definition_params)

    respond_to do |format|
      if @check_list_definition.save
        format.html { redirect_to check_list_definitions_path, notice: 'Check list definition was successfully created.' }
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
        format.html { redirect_to check_list_definitions_path, notice: 'Check list definition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @check_list_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # fork la checklist pour le nouvel utilisateur
  def start
    @check_list = check_list_factory.create(@check_list_definition, current_user)
    respond_to do |format|
      format.html { redirect_to edit_check_list_url(@check_list) }
      format.json { head :no_content }
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
          .permit(:user_id,
                  :name,
                  :description,
                  task_definitions_attributes: [:id, :text, :step]
                 )
  end

  def check_list_factory
    @check_list_factory ||= CheckListFactory.new
  end 

end
