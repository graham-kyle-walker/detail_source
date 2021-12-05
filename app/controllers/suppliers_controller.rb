class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  def index
    @q = Supplier.ransack(params[:q])
    @suppliers = @q.result(:distinct => true).includes(:products, :projects, :details).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@suppliers.where.not(:location_latitude => nil)) do |supplier, marker|
      marker.lat supplier.location_latitude
      marker.lng supplier.location_longitude
      marker.infowindow "<h5><a href='/suppliers/#{supplier.id}'>#{supplier.name}</a></h5><small>#{supplier.location_formatted_address}</small>"
    end
  end

  # GET /suppliers/1
  def show
    @product = Product.new
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to @supplier, notice: 'Supplier was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /suppliers/1
  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: 'Supplier was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /suppliers/1
  def destroy
    @supplier.destroy
    redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def supplier_params
      params.require(:supplier).permit(:name, :location, :contact_information)
    end
end
