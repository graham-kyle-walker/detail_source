class DesignersController < ApplicationController
  before_action :set_designer, only: [:show, :edit, :update, :destroy]

  # GET /designers
  def index
    @q = Designer.ransack(params[:q])
    @designers = @q.result(:distinct => true).includes(:project, :details, :designers).page(params[:page]).per(10)
  end

  # GET /designers/1
  def show
    @detail = Detail.new
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
      message = 'Designer was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @designer, notice: message
      end
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
    message = "Designer was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to designers_url, notice: message
    end
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
