class AddDateTimeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :date_time, :datetime
  end
end
