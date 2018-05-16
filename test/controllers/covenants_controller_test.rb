require 'test_helper'

class CovenantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @covenant = covenants(:one)
  end

  test "should get index" do
    get covenants_url
    assert_response :success
  end

  test "should get new" do
    get new_covenant_url
    assert_response :success
  end

  test "should create covenant" do
    assert_difference('Covenant.count') do
      post covenants_url, params: { covenant: { discipleship_id: @covenant.discipleship_id, student_id: @covenant.student_id, urlMultimedia: @covenant.urlMultimedia } }
    end

    assert_redirected_to covenant_url(Covenant.last)
  end

  test "should show covenant" do
    get covenant_url(@covenant)
    assert_response :success
  end

  test "should get edit" do
    get edit_covenant_url(@covenant)
    assert_response :success
  end

  test "should update covenant" do
    patch covenant_url(@covenant), params: { covenant: { discipleship_id: @covenant.discipleship_id, student_id: @covenant.student_id, urlMultimedia: @covenant.urlMultimedia } }
    assert_redirected_to covenant_url(@covenant)
  end

  test "should destroy covenant" do
    assert_difference('Covenant.count', -1) do
      delete covenant_url(@covenant)
    end

    assert_redirected_to covenants_url
  end
end
