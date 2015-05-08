json.array!(@points_logs) do |points_log|
  json.extract! points_log, :id, :circle_id, :policy_id, :reward_takeup_id, :event_type, :debit, :credit, :balance
  json.url points_log_url(points_log, format: :json)
end
