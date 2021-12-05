class Api::V1::MaterialsController < Api::V1::GraphitiController
  def index
    materials = MaterialResource.all(params)
    respond_with(materials)
  end

  def show
    material = MaterialResource.find(params)
    respond_with(material)
  end

  def create
    material = MaterialResource.build(params)

    if material.save
      render jsonapi: material, status: :created
    else
      render jsonapi_errors: material
    end
  end

  def update
    material = MaterialResource.find(params)

    if material.update_attributes
      render jsonapi: material
    else
      render jsonapi_errors: material
    end
  end

  def destroy
    material = MaterialResource.find(params)

    if material.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: material
    end
  end
end
