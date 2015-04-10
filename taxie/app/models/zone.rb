class Zone < ActiveRecord::Base
  belongs_to :district
  has_many :reservations
end
