class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :update2, :cancelar, :feedback, :asignar]

  respond_to :html

  def update2
    @reservation.update(reservation_params)

    @reservation.reservation_status_id ="2"
    @reservation.save

    respond_with(@reservation, :location => reservations_path)
  end


  def asignar
    @cars=Car.where("car_status_id=?",2)
  end


  def index

    if current_user.user_type_id == 3
      @reservations = Reservation.where(:reservation_status_id => [1,2])
    elsif current_user.user_type_id == 1
    @reservations = current_user.reservations.where(:reservation_status_id => [1,2])
  else current_user.user_type_id == 2

    @c1 = Car.find_by(user_id: current_user.id)
    @reservations = Reservation.where(car_id: @c1)

  end
    respond_with(@reservations)

  end

  def cancelar
    @reservation.reservation_status_id ="4"
    @reservation.save
  end

  def feedback


  end


  def historial
    if current_user.user_type_id == 3
    @reservations = Reservation.where(:reservation_status_id => [3,4])
    else
      @reservations = current_user.reservations.where(:reservation_status_id => [3,4])
    end
    respond_with(@reservations)
  end



  def show
    respond_with(@reservation)
  end

  def new
    @reservation = Reservation.new
    respond_with(@reservation)
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    respond_with(@reservation)
  end

  def update
    @reservation.update(reservation_params)
    respond_with(@reservation, :location => reservations_historial_path)
  end

  def destroy
    @reservation.destroy
    respond_with(@reservation)
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:feedback, :rate_id, :district_o_id, :zone_o_id, :address_o, :ref_o, :district_d_id, :zone_o_id, :address_d, :ref_d, :price, :passengers_qty, :payment_method, :user_id, :car_type, :car_id)
    end
end
