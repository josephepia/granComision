require 'test_helper'

class PreviousChurchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @previous_church = previous_churches(:one)
  end

  test "should get index" do
    get previous_churches_url
    assert_response :success
  end

  test "should get new" do
    get new_previous_church_url
    assert_response :success
  end

  test "should create previous_church" do
    assert_difference('PreviousChurch.count') do
      post previous_churches_url, params: { previous_church: { address_id: @previous_church.address_id, nombre: @previous_church.nombre, tiempo: @previous_church.tiempo, user_id: @previous_church.user_id } }
    end

    assert_redirected_to previous_church_url(PreviousChurch.last)
  end

  test "should show previous_church" do
    get previous_church_url(@previous_church)
    assert_response :success
  end

  test "should get edit" do
    get edit_previous_church_url(@previous_church)
    assert_response :success
  end

  test "should update previous_church" do
    patch previous_church_url(@previous_church), params: { previous_church: { address_id: @previous_church.address_id, nombre: @previous_church.nombre, tiempo: @previous_church.tiempo, user_id: @previous_church.user_id } }
    assert_redirected_to previous_church_url(@previous_church)
  end

  test "should destroy previous_church" do
    assert_difference('PreviousChurch.count', -1) do
      delete previous_church_url(@previous_church)
    end

    assert_redirected_to previous_churches_url
  end
end
