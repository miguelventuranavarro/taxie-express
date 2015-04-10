class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :car
  belongs_to :car_type
  belongs_to :payment_method
  belongs_to :reservation_status
  belongs_to :reservation_type
  #belongs_to :district
  #belongs_to :zone

#validates :address_o, presence: true



belongs_to :district_o, :class_name => 'District' , :foreign_key => 'district_o_id'
belongs_to :district_d, :class_name => 'District' , :foreign_key => 'district_d_id'

belongs_to :zone_o, :class_name => 'Zone' , :foreign_key => 'zone_o_id'
belongs_to :zone_d, :class_name => 'Zone' , :foreign_key => 'zone_d_id'


  before_create :set_default_reservation_status
  after_create :update_code


  private

  def update_code
  	id = Reservation.last.id.to_s.rjust(4,'0')
    self.update_column(:code, Reservation.last.created_at.strftime("%Y%m%d")+id.to_s)

  end
  
  def set_default_reservation_status
    self.reservation_status ||= ReservationStatus.find_by_id('1')
  end
end
