require 'test_helper'

class MinisteriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ministery = ministeries(:one)
  end

  test "should get index" do
    get ministeries_url
    assert_response :success
  end

  test "should get new" do
    get new_ministery_url
    assert_response :success
  end

  test "should create ministery" do
    assert_difference('Ministery.count') do
      post ministeries_url, params: { ministery: { nombre: @ministery.nombre, text: @ministery.text } }
    end

    assert_redirected_to ministery_url(Ministery.last)
  end

  test "should show ministery" do
    get ministery_url(@ministery)
    assert_response :success
  end

  test "should get edit" do
    get edit_ministery_url(@ministery)
    assert_response :success
  end

  test "should update ministery" do
    patch ministery_url(@ministery), params: { ministery: { nombre: @ministery.nombre, text: @ministery.text } }
    assert_redirected_to ministery_url(@ministery)
  end

  test "should destroy ministery" do
    assert_difference('Ministery.count', -1) do
      delete ministery_url(@ministery)
    end

    assert_redirected_to ministeries_url
  end
end
