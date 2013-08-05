require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get signup_completed" do
    get :signup_completed
    assert_response :success
  end

end
