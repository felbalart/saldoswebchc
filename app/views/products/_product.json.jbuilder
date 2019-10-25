json.extract! product, :id, :name, :brief, :base_price, :discount, :sale_price, :stock, :second_class, :group, :subgroup, :priority, :created_at, :updated_at
json.url product_url(product, format: :json)
