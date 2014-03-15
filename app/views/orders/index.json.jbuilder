json.array!(@orders) do |order|
  json.extract! order, :id, :order_status, :payment, :address, :city, :buyer_name, :buyer_lastname
  json.url order_url(order, format: :json)
end
