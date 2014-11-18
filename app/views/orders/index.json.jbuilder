json.array!(@orders) do |order|
  json.extract! order, :id, :product_id, :user_id, :admin_id
  json.url order_url(order, format: :json)
end
