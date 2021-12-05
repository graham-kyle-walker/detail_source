json.extract! saved_detail, :id, :detail_id, :user_id, :created_at, :updated_at
json.url saved_detail_url(saved_detail, format: :json)
