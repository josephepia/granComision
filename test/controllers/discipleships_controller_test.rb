require 'test_helper'

class DiscipleshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discipleship = discipleships(:one)
  end

  test "should get index" do
    get discipleships_url
    assert_response :success
  end

  test "should get new" do
    get new_discipleship_url
    assert_response :success
  end

  test "should create discipleship" do
    assert_difference('Discipleship.count') do
      post discipleships_url, params: { discipleship: { descripcion: @discipleship.descripcion, descripcionPacto: @discipleship.descripcionPacto, nombre: @discipleship.nombre, rangoOtorgado: @discipleship.rangoOtorgado } }
    end

    assert_redirected_to discipleship_url(Discipleship.last)
  end

  test "should show discipleship" do
    get discipleship_url(@discipleship)
    assert_response :success
  end

  test "should get edit" do
    get edit_discipleship_url(@discipleship)
    assert_response :success
  end

  test "should update discipleship" do
    patch discipleship_url(@discipleship), params: { discipleship: { descripcion: @discipleship.descripcion, descripcionPacto: @discipleship.descripcionPacto, nombre: @discipleship.nombre, rangoOtorgado: @discipleship.rangoOtorgado } }
    assert_redirected_to discipleship_url(@discipleship)
  end

  test "should destroy discipleship" do
    assert_difference('Discipleship.count', -1) do
      delete discipleship_url(@discipleship)
    end

    assert_redirected_to discipleships_url
  end
end
