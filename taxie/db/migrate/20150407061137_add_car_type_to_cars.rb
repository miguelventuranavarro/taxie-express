class AddCarTypeToCars < ActiveRecord::Migration
  def change
    add_reference :cars, :car_type, index: true
  end
end
