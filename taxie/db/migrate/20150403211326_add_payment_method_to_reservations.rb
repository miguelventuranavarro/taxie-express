class AddPaymentMethodToReservations < ActiveRecord::Migration
  def change
    add_reference :reservations, :payment_method, index: true
  end
end
