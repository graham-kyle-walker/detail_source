class MaterialsController < ApplicationController
  before_action :set_material, only: %i[show edit update destroy]

  def index
    @q = Material.ransack(params[:q])
    @materials = @q.result(distinct: true).includes(:detail,
                                                    :product).page(params[:page]).per(10)
  end

  def show; end

  def new
    @material = Material.new
  end

  def edit; end

  def create
    @material = Material.new(material_params)

    if @material.save
      message = "Material was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @material, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @material.update(material_params)
      redirect_to @material, notice: "Material was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @material.destroy
    message = "Material was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to materials_url, notice: message
    end
  end

  private

  def set_material
    @material = Material.find(params[:id])
  end

  def material_params
    params.require(:material).permit(:name, :product_id, :detail_id)
  end
end
