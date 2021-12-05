class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update destroy]

  def index
    @q = Supplier.ransack(params[:q])
    @suppliers = @q.result(distinct: true).includes(:products, :projects,
                                                    :details).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@suppliers.where.not(location_latitude: nil)) do |supplier, marker|
      marker.lat supplier.location_latitude
      marker.lng supplier.location_longitude
    end
  end

  def show
    @product = Product.new
  end

  def new
    @supplier = Supplier.new
  end

  def edit; end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to @supplier, notice: "Supplier was successfully created."
    else
      render :new
    end
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: "Supplier was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @supplier.destroy
    redirect_to suppliers_url, notice: "Supplier was successfully destroyed."
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:name, :location, :contact_information)
  end
end
