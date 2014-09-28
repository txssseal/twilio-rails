require 'test_helper'

class CallsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create_call" do
    get :create_call
    assert_response :success
  end

end
