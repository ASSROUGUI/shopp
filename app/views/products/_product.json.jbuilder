json.extract! product, :id, :title, :content, :price, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
