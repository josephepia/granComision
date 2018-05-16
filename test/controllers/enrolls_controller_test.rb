require 'test_helper'

class EnrollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enroll = enrolls(:one)
  end

  test "should get index" do
    get enrolls_url
    assert_response :success
  end

  test "should get new" do
    get new_enroll_url
    assert_response :success
  end

  test "should create enroll" do
    assert_difference('Enroll.count') do
      post enrolls_url, params: { enroll: { definitiva: @enroll.definitiva, discipleship_id: @enroll.discipleship_id, student_id: @enroll.student_id } }
    end

    assert_redirected_to enroll_url(Enroll.last)
  end

  test "should show enroll" do
    get enroll_url(@enroll)
    assert_response :success
  end

  test "should get edit" do
    get edit_enroll_url(@enroll)
    assert_response :success
  end

  test "should update enroll" do
    patch enroll_url(@enroll), params: { enroll: { definitiva: @enroll.definitiva, discipleship_id: @enroll.discipleship_id, student_id: @enroll.student_id } }
    assert_redirected_to enroll_url(@enroll)
  end

  test "should destroy enroll" do
    assert_difference('Enroll.count', -1) do
      delete enroll_url(@enroll)
    end

    assert_redirected_to enrolls_url
  end
end
