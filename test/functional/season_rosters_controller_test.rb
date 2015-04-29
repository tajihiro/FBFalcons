require 'test_helper'

class SeasonRostersControllerTest < ActionController::TestCase
  setup do
    @season_roster = season_rosters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:season_rosters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create season_roster" do
    assert_difference('SeasonRoster.count') do
      post :create, season_roster: {  }
    end

    assert_redirected_to season_roster_path(assigns(:season_roster))
  end

  test "should show season_roster" do
    get :show, id: @season_roster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @season_roster
    assert_response :success
  end

  test "should update season_roster" do
    put :update, id: @season_roster, season_roster: {  }
    assert_redirected_to season_roster_path(assigns(:season_roster))
  end

  test "should destroy season_roster" do
    assert_difference('SeasonRoster.count', -1) do
      delete :destroy, id: @season_roster
    end

    assert_redirected_to season_rosters_path
  end
end
