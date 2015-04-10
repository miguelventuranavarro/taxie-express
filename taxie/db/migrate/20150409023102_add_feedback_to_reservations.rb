class AddFeedbackToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :feedback, :text
  end
end
