json.extract! product, :id, :name, :price, :description, :supplier_id, :image,
              :created_at, :updated_at
json.url product_url(product, format: :json)
