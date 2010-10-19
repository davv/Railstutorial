require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get regist" do
    get :regist
    assert_response :success
  end

  test "should get game" do
    get :game
    assert_response :success
  end

  test "should get history" do
    get :history
    assert_response :success
  end

end
