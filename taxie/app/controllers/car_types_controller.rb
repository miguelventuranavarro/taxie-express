class CarTypesController < ApplicationController
  before_action :set_car_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @car_types = CarType.all
    respond_with(@car_types)
  end

  def show
    respond_with(@car_type)
  end

  def new
    @car_type = CarType.new
    respond_with(@car_type)
  end

  def edit
  end

  def create
    @car_type = CarType.new(car_type_params)
    @car_type.save
    respond_with(@car_type)
  end

  def update
    @car_type.update(car_type_params)
    respond_with(@car_type)
  end

  def destroy
    @car_type.destroy
    respond_with(@car_type)
  end

  private
    def set_car_type
      @car_type = CarType.find(params[:id])
    end

    def car_type_params
      params.require(:car_type).permit(:name)
    end
end
