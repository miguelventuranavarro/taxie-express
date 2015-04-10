class ReserveController < ApplicationController
  before_action :set_reservation, only: [:show, :edit]
  before_action :authenticate_user!
  respond_to :html
  def new
  end 

  def index
    @err = params[:err]
    @districts = District.all   
    @zones = Zone.where("district_id = ?", District.first.id)
    @car_types = CarType.all 
    @payment_methods = PaymentMethod.all 
    @favorite_addresses = FavoriteAddress.where("user_id = ?", current_user.id)     
  end

  def create
    @zone_id_o = params[:reservation][:zone_o_id]
    @zone_id_o = params[:reservation][:zone_d_id]
    @dis_o = params[:reservation][:address_o]
    @ref_o = params[:reservation][:ref_o]
    @dis_d = params[:reservation][:address_d]
    @ref_d = params[:reservation][:ref_d]    

    if @zone_id_o == "" || @zone_id_d == "" || @dis_o == "" || @ref_o == "" || @dis_d == "" || @ref_d == ""
      redirect_to "/reserva?err=1"
    else
      @reservation = Reservation.new(reservation_params)
      @reservation.save
      respond_with(@reservation)
    end
  end

  def calc_rate
    @calc_rate = Rate.find_by(["zone_o_id = ? AND zone_d_id = ?", params[:zone_o_id], params[:zone_d_id]])
    respond_to do |format|
     format.js
    end
  end  

  def favorite_address_select
    @fav_o_id = params[:favaddress_o_id];
    @favorite_address_o = FavoriteAddress.find_by(["id = ? ", params[:favaddress_o_id]])
    @district_o = District.find_by("id =?", @favorite_address_o.district_id)
    @zone_o = Zone.find_by("id =?", @favorite_address_o.zone_id)
    @favorite_address_d = FavoriteAddress.find_by(["id = ? ", params[:favaddress_d_id]])
    @district_d = District.find_by("id =?", @favorite_address_d.district_id)
    @zone_d = Zone.find_by("id =?", @favorite_address_d.zone_id)
    @calc_rate = Rate.find_by(["zone_o_id = ? AND zone_d_id = ?", @zone_o.id, @zone_d.id])    
    respond_to do |format|
     format.js
    end
   
  end  

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:rate_id, :district_o_id, :zone_o_id, :address_o, :ref_o, :district_d_id, :zone_o_id, :address_d, :ref_d, :price, :passengers_qty, :payment_method_id, :zone_d_id, :user_id, :car_id, :reservation_type_id, :date_time, :car_type_id)
    end  
end