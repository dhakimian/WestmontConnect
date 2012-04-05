require 'test_helper'

class AdminPagesControllerTest < ActionController::TestCase
  test "should get queue" do
    get :queue
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get searchresults" do
    get :searchresults
    assert_response :success
  end

  test "should get directory" do
    get :directory
    assert_response :success
  end

  test "should get edituser" do
    get :edituser
    assert_response :success
  end

  test "should get newsletter" do
    get :newsletter
    assert_response :success
  end

end
