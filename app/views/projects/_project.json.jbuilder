json.extract! project, :id, :project_manager_id, :location, :completion_date, :name, :description, :created_at, :updated_at
json.url project_url(project, format: :json)
