json.array!(@zones) do |zone|
  json.extract! zone, :id, :name, :district_id
  json.url zone_url(zone, format: :json)
end
