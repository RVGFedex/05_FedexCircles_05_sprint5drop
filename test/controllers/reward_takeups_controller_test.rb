require 'test_helper'

class RewardTakeupsControllerTest < ActionController::TestCase
  setup do
    @reward_takeup = reward_takeups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reward_takeups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward_takeup" do
    assert_difference('RewardTakeup.count') do
      post :create, reward_takeup: { reward_id: @reward_takeup.reward_id, user_id: @reward_takeup.user_id }
    end

    assert_redirected_to reward_takeup_path(assigns(:reward_takeup))
  end

  test "should show reward_takeup" do
    get :show, id: @reward_takeup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reward_takeup
    assert_response :success
  end

  test "should update reward_takeup" do
    patch :update, id: @reward_takeup, reward_takeup: { reward_id: @reward_takeup.reward_id, user_id: @reward_takeup.user_id }
    assert_redirected_to reward_takeup_path(assigns(:reward_takeup))
  end

  test "should destroy reward_takeup" do
    assert_difference('RewardTakeup.count', -1) do
      delete :destroy, id: @reward_takeup
    end

    assert_redirected_to reward_takeups_path
  end
end
