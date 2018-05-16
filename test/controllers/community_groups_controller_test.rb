require 'test_helper'

class CommunityGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_group = community_groups(:one)
  end

  test "should get index" do
    get community_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_community_group_url
    assert_response :success
  end

  test "should create community_group" do
    assert_difference('CommunityGroup.count') do
      post community_groups_url, params: { community_group: { nombre: @community_group.nombre } }
    end

    assert_redirected_to community_group_url(CommunityGroup.last)
  end

  test "should show community_group" do
    get community_group_url(@community_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_group_url(@community_group)
    assert_response :success
  end

  test "should update community_group" do
    patch community_group_url(@community_group), params: { community_group: { nombre: @community_group.nombre } }
    assert_redirected_to community_group_url(@community_group)
  end

  test "should destroy community_group" do
    assert_difference('CommunityGroup.count', -1) do
      delete community_group_url(@community_group)
    end

    assert_redirected_to community_groups_url
  end
end
