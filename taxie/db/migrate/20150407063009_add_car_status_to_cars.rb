class AddCarStatusToCars < ActiveRecord::Migration
  def change
    add_reference :cars, :car_status, index: true
  end
end
