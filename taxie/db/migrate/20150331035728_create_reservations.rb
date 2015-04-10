class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :rate_id
      t.integer :district_o_id
      t.integer :zone_o_id
      t.string :address_o
      t.string :ref_o
      t.integer :district_d_id
      t.integer :zone_o_id
      t.string :address_d
      t.string :ref_d
      t.integer :price
      t.integer :passengers_qty
      t.integer :payment_method
      t.references :user, index: true
      t.references :car, index: true

      t.timestamps
    end
  end
end
