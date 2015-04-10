json.array!(@reservation_statuses) do |reservation_status|
  json.extract! reservation_status, :id, :name
  json.url reservation_status_url(reservation_status, format: :json)
end
