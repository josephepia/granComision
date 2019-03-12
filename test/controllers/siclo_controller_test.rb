require 'test_helper'

class SicloControllerTest < ActionDispatch::IntegrationTest
  test "should get iniciar" do
    get siclo_iniciar_url
    assert_response :success
  end

  test "should get cerrar" do
    get siclo_cerrar_url
    assert_response :success
  end

  test "should get cargarNotas" do
    get siclo_cargarNotas_url
    assert_response :success
  end

end
