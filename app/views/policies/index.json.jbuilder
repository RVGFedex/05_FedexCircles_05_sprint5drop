json.array!(@policies) do |policy|
  json.extract! policy, :id, :user_id, :product_id, :policy_number, :premium, :frequency, :status
  json.url policy_url(policy, format: :json)
end
