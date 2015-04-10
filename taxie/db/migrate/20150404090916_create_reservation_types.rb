class CreateReservationTypes < ActiveRecord::Migration
  def change
    create_table :reservation_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
