require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, member: { address: @member.address, birth_place: @member.birth_place, birthday: @member.birthday, first_en_name: @member.first_en_name, first_name: @member.first_name, gender: @member.gender, image_url: @member.image_url, jersey_number: @member.jersey_number, last_en_name: @member.last_en_name, last_name: @member.last_name, nick_name: @member.nick_name }
    end

    assert_redirected_to member_path(assigns(:member))
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success
  end

  test "should update member" do
    put :update, id: @member, member: { address: @member.address, birth_place: @member.birth_place, birthday: @member.birthday, first_en_name: @member.first_en_name, first_name: @member.first_name, gender: @member.gender, image_url: @member.image_url, jersey_number: @member.jersey_number, last_en_name: @member.last_en_name, last_name: @member.last_name, nick_name: @member.nick_name }
    assert_redirected_to member_path(assigns(:member))
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end
end
