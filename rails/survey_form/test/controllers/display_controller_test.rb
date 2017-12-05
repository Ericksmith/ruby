require 'test_helper'

class DisplayControllerTest < ActionController::TestCase
  test "should get result" do
    get :result
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
