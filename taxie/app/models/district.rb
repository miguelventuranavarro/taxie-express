class District < ActiveRecord::Base
	has_many :zones
	has_many :reservations
end
