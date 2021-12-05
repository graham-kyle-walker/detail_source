class Api::V1::SavedDetailsController < Api::V1::GraphitiController
  def index
    saved_details = SavedDetailResource.all(params)
    respond_with(saved_details)
  end

  def show
    saved_detail = SavedDetailResource.find(params)
    respond_with(saved_detail)
  end

  def create
    saved_detail = SavedDetailResource.build(params)

    if saved_detail.save
      render jsonapi: saved_detail, status: 201
    else
      render jsonapi_errors: saved_detail
    end
  end

  def update
    saved_detail = SavedDetailResource.find(params)

    if saved_detail.update_attributes
      render jsonapi: saved_detail
    else
      render jsonapi_errors: saved_detail
    end
  end

  def destroy
    saved_detail = SavedDetailResource.find(params)

    if saved_detail.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: saved_detail
    end
  end
end
