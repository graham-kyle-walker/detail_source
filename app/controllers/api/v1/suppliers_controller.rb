class Api::V1::SuppliersController < Api::V1::GraphitiController
  def index
    suppliers = SupplierResource.all(params)
    respond_with(suppliers)
  end

  def show
    supplier = SupplierResource.find(params)
    respond_with(supplier)
  end

  def create
    supplier = SupplierResource.build(params)

    if supplier.save
      render jsonapi: supplier, status: 201
    else
      render jsonapi_errors: supplier
    end
  end

  def update
    supplier = SupplierResource.find(params)

    if supplier.update_attributes
      render jsonapi: supplier
    else
      render jsonapi_errors: supplier
    end
  end

  def destroy
    supplier = SupplierResource.find(params)

    if supplier.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: supplier
    end
  end
end
