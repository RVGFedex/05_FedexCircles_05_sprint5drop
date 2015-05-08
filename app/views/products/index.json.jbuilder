json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :spweight, :rpweight
  json.url product_url(product, format: :json)
end
