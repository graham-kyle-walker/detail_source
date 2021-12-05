class SavedDetailsController < ApplicationController
  before_action :set_saved_detail, only: [:show, :edit, :update, :destroy]

  # GET /saved_details
  def index
    @saved_details = SavedDetail.all
  end

  # GET /saved_details/1
  def show
  end

  # GET /saved_details/new
  def new
    @saved_detail = SavedDetail.new
  end

  # GET /saved_details/1/edit
  def edit
  end

  # POST /saved_details
  def create
    @saved_detail = SavedDetail.new(saved_detail_params)

    if @saved_detail.save
      redirect_to @saved_detail, notice: 'Saved detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /saved_details/1
  def update
    if @saved_detail.update(saved_detail_params)
      redirect_to @saved_detail, notice: 'Saved detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /saved_details/1
  def destroy
    @saved_detail.destroy
    redirect_to saved_details_url, notice: 'Saved detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_detail
      @saved_detail = SavedDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def saved_detail_params
      params.require(:saved_detail).permit(:detail_id, :user_id)
    end
end
