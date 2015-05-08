require 'test_helper'

class PointsLogsControllerTest < ActionController::TestCase
  setup do
    @points_log = points_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create points_log" do
    assert_difference('PointsLog.count') do
      post :create, points_log: { balance: @points_log.balance, circle_id: @points_log.circle_id, credit: @points_log.credit, debit: @points_log.debit, event_type: @points_log.event_type, policy_id: @points_log.policy_id, reward_takeup_id: @points_log.reward_takeup_id }
    end

    assert_redirected_to points_log_path(assigns(:points_log))
  end

  test "should show points_log" do
    get :show, id: @points_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @points_log
    assert_response :success
  end

  test "should update points_log" do
    patch :update, id: @points_log, points_log: { balance: @points_log.balance, circle_id: @points_log.circle_id, credit: @points_log.credit, debit: @points_log.debit, event_type: @points_log.event_type, policy_id: @points_log.policy_id, reward_takeup_id: @points_log.reward_takeup_id }
    assert_redirected_to points_log_path(assigns(:points_log))
  end

  test "should destroy points_log" do
    assert_difference('PointsLog.count', -1) do
      delete :destroy, id: @points_log
    end

    assert_redirected_to points_logs_path
  end
end
