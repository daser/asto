require 'test_helper'

class SuperbowlControllerTest < ActionController::TestCase
  test "should get approve" do
    get :approve
    assert_response :success
  end

end
