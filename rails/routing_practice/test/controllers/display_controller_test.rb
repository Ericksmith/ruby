require 'test_helper'

class DisplayControllerTest < ActionController::TestCase
  test "should get hello" do
    get :hello
    assert_response :success
  end

  test "should get say" do
    get :say
    assert_response :success
  end

  test "should get times" do
    get :times
    assert_response :success
  end

  test "should get restart" do
    get :restart
    assert_response :success
  end

end
