require 'test_helper'

class DisplayControllerTest < ActionController::TestCase
  test "should get indexnew" do
    get :indexnew
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get total" do
    get :total
    assert_response :success
  end

end
