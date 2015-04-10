require 'test_helper'

class FavoriteAddressesControllerTest < ActionController::TestCase
  setup do
    @favorite_address = favorite_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorite_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite_address" do
    assert_difference('FavoriteAddress.count') do
      post :create, favorite_address: { address: @favorite_address.address, district_id: @favorite_address.district_id, name: @favorite_address.name, ref: @favorite_address.ref, user_id: @favorite_address.user_id, zone_id: @favorite_address.zone_id }
    end

    assert_redirected_to favorite_address_path(assigns(:favorite_address))
  end

  test "should show favorite_address" do
    get :show, id: @favorite_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorite_address
    assert_response :success
  end

  test "should update favorite_address" do
    patch :update, id: @favorite_address, favorite_address: { address: @favorite_address.address, district_id: @favorite_address.district_id, name: @favorite_address.name, ref: @favorite_address.ref, user_id: @favorite_address.user_id, zone_id: @favorite_address.zone_id }
    assert_redirected_to favorite_address_path(assigns(:favorite_address))
  end

  test "should destroy favorite_address" do
    assert_difference('FavoriteAddress.count', -1) do
      delete :destroy, id: @favorite_address
    end

    assert_redirected_to favorite_addresses_path
  end
end
