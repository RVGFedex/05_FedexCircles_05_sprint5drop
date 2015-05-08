json.array!(@rewards) do |reward|
  json.extract! reward, :id, :product_id, :offer_type, :min_circle_size, :min_circle_points, :title, :points_cost, :discount, :desc1, :desc2, :artwork_filename, :status
  json.url reward_url(reward, format: :json)
end
