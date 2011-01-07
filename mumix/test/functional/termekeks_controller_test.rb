require 'test_helper'

class TermekeksControllerTest < ActionController::TestCase
  setup do
    @termekek = termekeks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:termekeks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create termekek" do
    assert_difference('Termekek.count') do
      post :create, :termekek => @termekek.attributes
    end

    assert_redirected_to termekek_path(assigns(:termekek))
  end

  test "should show termekek" do
    get :show, :id => @termekek.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @termekek.to_param
    assert_response :success
  end

  test "should update termekek" do
    put :update, :id => @termekek.to_param, :termekek => @termekek.attributes
    assert_redirected_to termekek_path(assigns(:termekek))
  end

  test "should destroy termekek" do
    assert_difference('Termekek.count', -1) do
      delete :destroy, :id => @termekek.to_param
    end

    assert_redirected_to termekeks_path
  end
end
