json.array!(@circles) do |circle|
  json.extract! circle, :id, :name, :group_code, :points, :status
  json.url circle_url(circle, format: :json)
end
