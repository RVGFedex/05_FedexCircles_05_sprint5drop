json.array!(@params) do |param|
  json.extract! param, :id, :grouping, :name, :value
  json.url param_url(param, format: :json)
end
