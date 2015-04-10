class AddReservationTypeToReservations < ActiveRecord::Migration
  def change
    add_reference :reservations, :reservation_type, index: true
  end
end
