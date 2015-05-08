json.array!(@users) do |user|
  json.extract! user, :id, :name, :role_id, :circle_id, :address, :phone_number, :dob
  json.url user_url(user, format: :json)
end
