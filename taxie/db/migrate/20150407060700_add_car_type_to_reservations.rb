class AddCarTypeToReservations < ActiveRecord::Migration
  def change
    add_reference :reservations, :car_type, index: true
  end
end
