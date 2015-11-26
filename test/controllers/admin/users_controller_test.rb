require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  test "should get admin:boolean" do
    get :admin:boolean
    assert_response :success
  end

end
