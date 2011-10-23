require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get positions_in_department" do
    get :positions_in_department
    assert_response :success
  end

end
