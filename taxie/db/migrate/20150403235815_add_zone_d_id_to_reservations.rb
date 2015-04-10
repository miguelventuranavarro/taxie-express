class AddZoneDIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :zone_d_id, :integer
  end
end
