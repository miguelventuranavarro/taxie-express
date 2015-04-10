class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cars = Car.all
    respond_with(@cars)
  end

  def show
    respond_with(@car)
  end

  def new
    @car = Car.new
    respond_with(@car)
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
    @car.save
    respond_with(@car)
  end

  def update
    @car.update(car_params)
    respond_with(@car)
  end

  def destroy
    @car.destroy
    respond_with(@car)
  end

  private
    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:name)
    end
end
