class CarType < ActiveRecord::Base
	has_many :cars
	has_many :reservations
end
