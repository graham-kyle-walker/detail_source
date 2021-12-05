json.extract! material, :id, :name, :product_id, :detail_id, :created_at,
              :updated_at
json.url material_url(material, format: :json)
