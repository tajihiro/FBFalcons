require 'test_helper'

class Sample::IndicesControllerTest < ActionController::TestCase
  setup do
    @sample_index = sample_indices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sample_indices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sample_index" do
    assert_difference('Sample::Index.count') do
      post :create, sample_index: { id: @sample_index.id, name: @sample_index.name }
    end

    assert_redirected_to sample_index_path(assigns(:sample_index))
  end

  test "should show sample_index" do
    get :show, id: @sample_index
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sample_index
    assert_response :success
  end

  test "should update sample_index" do
    put :update, id: @sample_index, sample_index: { id: @sample_index.id, name: @sample_index.name }
    assert_redirected_to sample_index_path(assigns(:sample_index))
  end

  test "should destroy sample_index" do
    assert_difference('Sample::Index.count', -1) do
      delete :destroy, id: @sample_index
    end

    assert_redirected_to sample_indices_path
  end
end
