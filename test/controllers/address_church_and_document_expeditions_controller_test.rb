require 'test_helper'

class AddressChurchAndDocumentExpeditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address_church_and_document_expedition = address_church_and_document_expeditions(:one)
  end

  test "should get index" do
    get address_church_and_document_expeditions_url
    assert_response :success
  end

  test "should get new" do
    get new_address_church_and_document_expedition_url
    assert_response :success
  end

  test "should create address_church_and_document_expedition" do
    assert_difference('AddressChurchAndDocumentExpedition.count') do
      post address_church_and_document_expeditions_url, params: { address_church_and_document_expedition: { city_id: @address_church_and_document_expedition.city_id, direccionIglesia: @address_church_and_document_expedition.direccionIglesia, nombreIglesiaAnterior: @address_church_and_document_expedition.nombreIglesiaAnterior, user_id: @address_church_and_document_expedition.user_id } }
    end

    assert_redirected_to address_church_and_document_expedition_url(AddressChurchAndDocumentExpedition.last)
  end

  test "should show address_church_and_document_expedition" do
    get address_church_and_document_expedition_url(@address_church_and_document_expedition)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_church_and_document_expedition_url(@address_church_and_document_expedition)
    assert_response :success
  end

  test "should update address_church_and_document_expedition" do
    patch address_church_and_document_expedition_url(@address_church_and_document_expedition), params: { address_church_and_document_expedition: { city_id: @address_church_and_document_expedition.city_id, direccionIglesia: @address_church_and_document_expedition.direccionIglesia, nombreIglesiaAnterior: @address_church_and_document_expedition.nombreIglesiaAnterior, user_id: @address_church_and_document_expedition.user_id } }
    assert_redirected_to address_church_and_document_expedition_url(@address_church_and_document_expedition)
  end

  test "should destroy address_church_and_document_expedition" do
    assert_difference('AddressChurchAndDocumentExpedition.count', -1) do
      delete address_church_and_document_expedition_url(@address_church_and_document_expedition)
    end

    assert_redirected_to address_church_and_document_expeditions_url
  end
end
