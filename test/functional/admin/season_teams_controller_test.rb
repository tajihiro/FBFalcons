require 'test_helper'

class Admin::SeasonTeamsControllerTest < ActionController::TestCase
  setup do
    @admin_season_team = admin_season_teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_season_teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_season_team" do
    assert_difference('Admin::SeasonTeam.count') do
      post :create, admin_season_team: {  }
    end

    assert_redirected_to admin_season_team_path(assigns(:admin_season_team))
  end

  test "should show admin_season_team" do
    get :show, id: @admin_season_team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_season_team
    assert_response :success
  end

  test "should update admin_season_team" do
    put :update, id: @admin_season_team, admin_season_team: {  }
    assert_redirected_to admin_season_team_path(assigns(:admin_season_team))
  end

  test "should destroy admin_season_team" do
    assert_difference('Admin::SeasonTeam.count', -1) do
      delete :destroy, id: @admin_season_team
    end

    assert_redirected_to admin_season_teams_path
  end
end
