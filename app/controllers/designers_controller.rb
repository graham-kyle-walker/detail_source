class DesignersController < ApplicationController
  before_action :set_designer, only: %i[show edit update destroy]

  def index
    @q = Designer.ransack(params[:q])
    @designers = @q.result(distinct: true).includes(:project, :details,
                                                    :designers).page(params[:page]).per(10)
  end

  def show
    @detail = Detail.new
  end

  def new
    @designer = Designer.new
  end

  def edit; end

  def create
    @designer = Designer.new(designer_params)

    if @designer.save
      message = "Designer was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @designer, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @designer.update(designer_params)
      redirect_to @designer, notice: "Designer was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @designer.destroy
    message = "Designer was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to designers_url, notice: message
    end
  end

  private

  def set_designer
    @designer = Designer.find(params[:id])
  end

  def designer_params
    params.require(:designer).permit(:project_id, :user_id)
  end
end
