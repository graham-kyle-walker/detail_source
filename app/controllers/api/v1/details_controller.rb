class Api::V1::DetailsController < Api::V1::GraphitiController
  def index
    details = DetailResource.all(params)
    respond_with(details)
  end

  def show
    detail = DetailResource.find(params)
    respond_with(detail)
  end

  def create
    detail = DetailResource.build(params)

    if detail.save
      render jsonapi: detail, status: :created
    else
      render jsonapi_errors: detail
    end
  end

  def update
    detail = DetailResource.find(params)

    if detail.update_attributes
      render jsonapi: detail
    else
      render jsonapi_errors: detail
    end
  end

  def destroy
    detail = DetailResource.find(params)

    if detail.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: detail
    end
  end
end
