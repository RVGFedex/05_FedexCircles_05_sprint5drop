json.array!(@reward_takeups) do |reward_takeup|
  json.extract! reward_takeup, :id, :reward_id, :user_id
  json.url reward_takeup_url(reward_takeup, format: :json)
end
