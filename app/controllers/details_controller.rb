class DetailsController < ApplicationController
  before_action :set_detail, only: [:show, :edit, :update, :destroy]

  # GET /details
  def index
    @q = Detail.ransack(params[:q])
    @details = @q.result(:distinct => true).includes(:materials, :bookmarks, :comments, :project, :designer, :suppliers, :detailer, :products).page(params[:page]).per(10)
  end

  # GET /details/1
  def show
    @comment = Comment.new
    @saved_detail = SavedDetail.new
    @material = Material.new
  end

  # GET /details/new
  def new
    @detail = Detail.new
  end

  # GET /details/1/edit
  def edit
  end

  # POST /details
  def create
    @detail = Detail.new(detail_params)

    if @detail.save
      message = 'Detail was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @detail, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /details/1
  def update
    if @detail.update(detail_params)
      redirect_to @detail, notice: 'Detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /details/1
  def destroy
    @detail.destroy
    message = "Detail was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to details_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail
      @detail = Detail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def detail_params
      params.require(:detail).permit(:project_id, :designer_id, :success_score, :description, :image, :name)
    end
end
