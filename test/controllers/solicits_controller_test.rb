require 'test_helper'

class SolicitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solicit = solicits(:one)
  end

  test "should get index" do
    get solicits_url
    assert_response :success
  end

  test "should get new" do
    get new_solicit_url
    assert_response :success
  end

  test "should create solicit" do
    assert_difference('Solicit.count') do
      post solicits_url, params: { solicit: { discipleship_id: @solicit.discipleship_id, user_id: @solicit.user_id } }
    end

    assert_redirected_to solicit_url(Solicit.last)
  end

  test "should show solicit" do
    get solicit_url(@solicit)
    assert_response :success
  end

  test "should get edit" do
    get edit_solicit_url(@solicit)
    assert_response :success
  end

  test "should update solicit" do
    patch solicit_url(@solicit), params: { solicit: { discipleship_id: @solicit.discipleship_id, user_id: @solicit.user_id } }
    assert_redirected_to solicit_url(@solicit)
  end

  test "should destroy solicit" do
    assert_difference('Solicit.count', -1) do
      delete solicit_url(@solicit)
    end

    assert_redirected_to solicits_url
  end
end
