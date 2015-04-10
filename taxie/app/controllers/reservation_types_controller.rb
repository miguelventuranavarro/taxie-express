class ReservationTypesController < ApplicationController
  before_action :set_reservation_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reservation_types = ReservationType.all
    respond_with(@reservation_types)
  end

  def show
    respond_with(@reservation_type)
  end

  def new
    @reservation_type = ReservationType.new
    respond_with(@reservation_type)
  end

  def edit
  end

  def create
    @reservation_type = ReservationType.new(reservation_type_params)
    @reservation_type.save
    respond_with(@reservation_type)
  end

  def update
    @reservation_type.update(reservation_type_params)
    respond_with(@reservation_type)
  end

  def destroy
    @reservation_type.destroy
    respond_with(@reservation_type)
  end

  private
    def set_reservation_type
      @reservation_type = ReservationType.find(params[:id])
    end

    def reservation_type_params
      params.require(:reservation_type).permit(:name)
    end
end
