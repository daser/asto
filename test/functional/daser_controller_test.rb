require 'test_helper'

class DaserControllerTest < ActionController::TestCase
  test "should get sunday" do
    get :sunday
    assert_response :success
  end

end
