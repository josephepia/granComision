require 'test_helper'

class PrincipalControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get principal_home_url
    assert_response :success
  end

end
