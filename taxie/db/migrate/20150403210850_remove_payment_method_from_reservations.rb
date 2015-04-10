class RemovePaymentMethodFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :payment_method, :integer
  end
end
