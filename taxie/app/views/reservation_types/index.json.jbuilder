json.array!(@reservation_types) do |reservation_type|
  json.extract! reservation_type, :id, :name
  json.url reservation_type_url(reservation_type, format: :json)
end
