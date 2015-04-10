json.array!(@favorite_addresses) do |favorite_address|
  json.extract! favorite_address, :id, :name, :address, :ref, :district_id, :zone_id, :user_id
  json.url favorite_address_url(favorite_address, format: :json)
end
