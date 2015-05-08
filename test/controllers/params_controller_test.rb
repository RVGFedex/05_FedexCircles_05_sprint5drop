require 'test_helper'

class ParamsControllerTest < ActionController::TestCase
  setup do
    @param = params(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:params)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create param" do
    assert_difference('Param.count') do
      post :create, param: { grouping: @param.grouping, name: @param.name, value: @param.value }
    end

    assert_redirected_to param_path(assigns(:param))
  end

  test "should show param" do
    get :show, id: @param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @param
    assert_response :success
  end

  test "should update param" do
    patch :update, id: @param, param: { grouping: @param.grouping, name: @param.name, value: @param.value }
    assert_redirected_to param_path(assigns(:param))
  end

  test "should destroy param" do
    assert_difference('Param.count', -1) do
      delete :destroy, id: @param
    end

    assert_redirected_to params_path
  end
end
