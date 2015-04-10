class PaymentMethod < ActiveRecord::Base
	has_many :reservations
end
