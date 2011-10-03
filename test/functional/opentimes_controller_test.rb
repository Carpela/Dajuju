require 'test_helper'

class OpentimesControllerTest < ActionController::TestCase
  setup do
    @opentime = opentimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opentimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opentime" do
    assert_difference('Opentime.count') do
      post :create, :opentime => @opentime.attributes
    end

    assert_redirected_to opentime_path(assigns(:opentime))
  end

  test "should show opentime" do
    get :show, :id => @opentime.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @opentime.to_param
    assert_response :success
  end

  test "should update opentime" do
    put :update, :id => @opentime.to_param, :opentime => @opentime.attributes
    assert_redirected_to opentime_path(assigns(:opentime))
  end

  test "should destroy opentime" do
    assert_difference('Opentime.count', -1) do
      delete :destroy, :id => @opentime.to_param
    end

    assert_redirected_to opentimes_path
  end
end
