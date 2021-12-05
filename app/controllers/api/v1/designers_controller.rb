class Api::V1::DesignersController < Api::V1::GraphitiController
  def index
    designers = DesignerResource.all(params)
    respond_with(designers)
  end

  def show
    designer = DesignerResource.find(params)
    respond_with(designer)
  end

  def create
    designer = DesignerResource.build(params)

    if designer.save
      render jsonapi: designer, status: :created
    else
      render jsonapi_errors: designer
    end
  end

  def update
    designer = DesignerResource.find(params)

    if designer.update_attributes
      render jsonapi: designer
    else
      render jsonapi_errors: designer
    end
  end

  def destroy
    designer = DesignerResource.find(params)

    if designer.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: designer
    end
  end
end
