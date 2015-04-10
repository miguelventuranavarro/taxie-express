require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post :create, reservation: { address_d: @reservation.address_d, address_o: @reservation.address_o, car_id: @reservation.car_id, district_d_id: @reservation.district_d_id, district_o_id: @reservation.district_o_id, passengers_qty: @reservation.passengers_qty, payment_method: @reservation.payment_method, price: @reservation.price, rate_id: @reservation.rate_id, ref_d: @reservation.ref_d, ref_o: @reservation.ref_o, user_id: @reservation.user_id, zone_o_id: @reservation.zone_o_id, zone_o_id: @reservation.zone_o_id }
    end

    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should show reservation" do
    get :show, id: @reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation
    assert_response :success
  end

  test "should update reservation" do
    patch :update, id: @reservation, reservation: { address_d: @reservation.address_d, address_o: @reservation.address_o, car_id: @reservation.car_id, district_d_id: @reservation.district_d_id, district_o_id: @reservation.district_o_id, passengers_qty: @reservation.passengers_qty, payment_method: @reservation.payment_method, price: @reservation.price, rate_id: @reservation.rate_id, ref_d: @reservation.ref_d, ref_o: @reservation.ref_o, user_id: @reservation.user_id, zone_o_id: @reservation.zone_o_id, zone_o_id: @reservation.zone_o_id }
    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete :destroy, id: @reservation
    end

    assert_redirected_to reservations_path
  end
end
