require 'test_helper'

class Admin::LoginControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get auth" do
    get :auth
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
