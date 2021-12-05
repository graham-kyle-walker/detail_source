class DetailsController < ApplicationController
  before_action :set_detail, only: %i[show edit update destroy]

  def index
    @q = Detail.ransack(params[:q])
    @details = @q.result(distinct: true).includes(:materials, :bookmarks,
                                                  :comments, :project, :designer, :suppliers, :detailer, :products).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
    @saved_detail = SavedDetail.new
    @material = Material.new
  end

  def new
    @detail = Detail.new
  end

  def edit; end

  def create
    @detail = Detail.new(detail_params)

    if @detail.save
      message = "Detail was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @detail, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @detail.update(detail_params)
      redirect_to @detail, notice: "Detail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @detail.destroy
    message = "Detail was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to details_url, notice: message
    end
  end

  private

  def set_detail
    @detail = Detail.find(params[:id])
  end

  def detail_params
    params.require(:detail).permit(:project_id, :designer_id, :success_score,
                                   :description, :image, :name)
  end
end
