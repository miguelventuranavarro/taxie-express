class ReserveController < ApplicationController
  before_action :set_reservation, only: [:show, :edit]
  before_action :authenticate_user!
  respond_to :html

  def new
  end	

  def index
  	@districts = District.all  	
  	@zones = Zone.where("district_id = ?", District.first.id)
    @car_types = CarType.all 
    @payment_methods = PaymentMethod.all
    @reservation_types = ReservationType.all      	
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    respond_with(@reservation)
  end

  def calc_rate
    @calc_rate = Rate.find_by(["zone_o_id = ? AND zone_d_id = ?", params[:zone_o_id], params[:zone_d_id]])
    respond_to do |format|
     format.js
    end
  end    

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:reservation_type_id, :district_o_id, :zone_o_id, :address_o, :ref_o, :district_d_id, :zone_o_id, :address_d, :ref_d, :price, :passengers_qty, :payment_method_id, :zone_d_id, :user_id, :car_type_id)
    end  
end


