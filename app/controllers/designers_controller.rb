class DesignersController < ApplicationController
  before_action :set_designer, only: [:show, :edit, :update, :destroy]

  # GET /designers
  def index
    @designers = Designer.all
  end

  # GET /designers/1
  def show
  end

  # GET /designers/new
  def new
    @designer = Designer.new
  end

  # GET /designers/1/edit
  def edit
  end

  # POST /designers
  def create
    @designer = Designer.new(designer_params)

    if @designer.save
      redirect_to @designer, notice: 'Designer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /designers/1
  def update
    if @designer.update(designer_params)
      redirect_to @designer, notice: 'Designer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /designers/1
  def destroy
    @designer.destroy
    redirect_to designers_url, notice: 'Designer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_designer
      @designer = Designer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def designer_params
      params.require(:designer).permit(:project_id, :user_id)
    end
end