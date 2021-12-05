class ProjectsController < ApplicationController
  before_action :current_user_must_be_project_project_manager,
                only: %i[edit update destroy]

  before_action :set_project, only: %i[show edit update destroy]

  def index
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true).includes(:details, :designers,
                                                   :project_manager, :suppliers).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@projects.where.not(location_latitude: nil)) do |project, marker|
      marker.lat project.location_latitude
      marker.lng project.location_longitude
    end
  end

  def show
    @designer = Designer.new
    @detail = Detail.new
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)

    if @project.save
      message = "Project was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @project, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    message = "Project was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to projects_url, notice: message
    end
  end

  private

  def current_user_must_be_project_project_manager
    set_project
    unless current_user == @project.project_manager
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:project_manager_id, :location,
                                    :completion_date, :name, :description)
  end
end
