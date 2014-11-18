json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :description, :quantity, :admin_id
  json.url product_url(product, format: :json)
end
