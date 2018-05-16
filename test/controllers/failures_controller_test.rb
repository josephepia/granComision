require 'test_helper'

class FailuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @failure = failures(:one)
  end

  test "should get index" do
    get failures_url
    assert_response :success
  end

  test "should get new" do
    get new_failure_url
    assert_response :success
  end

  test "should create failure" do
    assert_difference('Failure.count') do
      post failures_url, params: { failure: { enroll_id: @failure.enroll_id, fecha: @failure.fecha, session_id: @failure.session_id } }
    end

    assert_redirected_to failure_url(Failure.last)
  end

  test "should show failure" do
    get failure_url(@failure)
    assert_response :success
  end

  test "should get edit" do
    get edit_failure_url(@failure)
    assert_response :success
  end

  test "should update failure" do
    patch failure_url(@failure), params: { failure: { enroll_id: @failure.enroll_id, fecha: @failure.fecha, session_id: @failure.session_id } }
    assert_redirected_to failure_url(@failure)
  end

  test "should destroy failure" do
    assert_difference('Failure.count', -1) do
      delete failure_url(@failure)
    end

    assert_redirected_to failures_url
  end
end
