class CarStatusesController < ApplicationController
  before_action :set_car_status, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @car_statuses = CarStatus.all
    respond_with(@car_statuses)
  end

  def show
    respond_with(@car_status)
  end

  def new
    @car_status = CarStatus.new
    respond_with(@car_status)
  end

  def edit
  end

  def create
    @car_status = CarStatus.new(car_status_params)
    @car_status.save
    respond_with(@car_status)
  end

  def update
    @car_status.update(car_status_params)
    respond_with(@car_status)
  end

  def destroy
    @car_status.destroy
    respond_with(@car_status)
  end

  private
    def set_car_status
      @car_status = CarStatus.find(params[:id])
    end

    def car_status_params
      params.require(:car_status).permit(:name)
    end
end
