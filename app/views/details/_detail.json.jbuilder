json.extract! detail, :id, :project_id, :designer_id, :success_score,
              :description, :image, :name, :created_at, :updated_at
json.url detail_url(detail, format: :json)
