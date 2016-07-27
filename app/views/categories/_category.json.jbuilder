json.extract! category, :id, :name, :description, :img_url, :created_at, :updated_at
json.url category_url(category, format: :json)