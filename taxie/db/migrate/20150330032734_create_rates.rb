class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :zone_id_o
      t.integer :zone_id_d
      t.integer :price

      t.timestamps
    end
  end
end
