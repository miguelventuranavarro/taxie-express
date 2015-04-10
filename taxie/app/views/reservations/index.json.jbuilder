json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :rate_id, :district_o_id, :zone_o_id, :address_o, :ref_o, :district_d_id, :zone_o_id, :address_d, :ref_d, :price, :passengers_qty, :payment_method, :user_id, :car_id
  json.url reservation_url(reservation, format: :json)
end
