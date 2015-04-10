class FavoriteAddressesController < ApplicationController
  before_action :set_favorite_address, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @favorite_addresses = FavoriteAddress.all
    respond_with(@favorite_addresses)
  end

  def show
    respond_with(@favorite_address)
  end

  def new
    @favorite_address = FavoriteAddress.new
    respond_with(@favorite_address)
  end

  def edit
  end

  def create
    @favorite_address = FavoriteAddress.new(favorite_address_params)
    @favorite_address.save
    respond_with(@favorite_address)
  end

  def update
    @favorite_address.update(favorite_address_params)
    respond_with(@favorite_address)
  end

  def destroy
    @favorite_address.destroy
    respond_with(@favorite_address)
  end

  private
    def set_favorite_address
      @favorite_address = FavoriteAddress.find(params[:id])
    end

    def favorite_address_params
      params.require(:favorite_address).permit(:name, :address, :ref, :district_id, :zone_id, :user_id)
    end
end
