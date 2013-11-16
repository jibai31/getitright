class CheckListDefinitionsController < ApplicationController
  before_action :set_check_list_definition, only: [:show, :edit, :update, :destroy]
  # GET /check_list_definitions
  # GET /check_list_definitions.json
  def index
    if user_signed_in?
      @check_list_definitions = current_user.check_list_definitions
    else
      @check_list_definitions = CheckListDefinition.all
    end
  end

  # GET /check_list_definitions/1
  # GET /check_list_definitions/1.json
  def show
  end

  # GET /check_list_definitions/new
  def new
    if user_signed_in?
      @check_list_definition = current_user.check_list_definitions.build
      @check_list_definition.user = current_user
    end

  end

  # GET /check_list_definitions/1/edit
  def edit
  end

  # POST /check_list_definitions
  # POST /check_list_definitions.json
  def create
    @check_list_definition = current_user.check_list_definitions.build(check_list_definition_params)
    @check_list_definition.user = current_user

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

  # PATCH/PUT /check_list_definitions/1
  # PATCH/PUT /check_list_definitions/1.json
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

  # DELETE /check_list_definitions/1
  # DELETE /check_list_definitions/1.json
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
    params.require(:check_list_definition).permit(:user_id, :name, :description)
  end
end
