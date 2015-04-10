require 'test_helper'

class ReservationStatusesControllerTest < ActionController::TestCase
  setup do
    @reservation_status = reservation_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservation_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation_status" do
    assert_difference('ReservationStatus.count') do
      post :create, reservation_status: { name: @reservation_status.name }
    end

    assert_redirected_to reservation_status_path(assigns(:reservation_status))
  end

  test "should show reservation_status" do
    get :show, id: @reservation_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation_status
    assert_response :success
  end

  test "should update reservation_status" do
    patch :update, id: @reservation_status, reservation_status: { name: @reservation_status.name }
    assert_redirected_to reservation_status_path(assigns(:reservation_status))
  end

  test "should destroy reservation_status" do
    assert_difference('ReservationStatus.count', -1) do
      delete :destroy, id: @reservation_status
    end

    assert_redirected_to reservation_statuses_path
  end
end
