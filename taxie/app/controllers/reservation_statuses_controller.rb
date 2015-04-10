class ReservationStatusesController < ApplicationController
  before_action :set_reservation_status, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reservation_statuses = ReservationStatus.all
    respond_with(@reservation_statuses)
  end

  def show
    respond_with(@reservation_status)
  end

  def new
    @reservation_status = ReservationStatus.new
    respond_with(@reservation_status)
  end

  def edit
  end

  def create
    @reservation_status = ReservationStatus.new(reservation_status_params)
    @reservation_status.save
    respond_with(@reservation_status)
  end

  def update
    @reservation_status.update(reservation_status_params)
    respond_with(@reservation_status)
  end

  def destroy
    @reservation_status.destroy
    respond_with(@reservation_status)
  end

  private
    def set_reservation_status
      @reservation_status = ReservationStatus.find(params[:id])
    end

    def reservation_status_params
      params.require(:reservation_status).permit(:name)
    end
end
