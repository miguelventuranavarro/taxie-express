class Car < ActiveRecord::Base
	belongs_to :car_type
	belongs_to :car_status
	has_many :reservations
	belongs_to :user
end
