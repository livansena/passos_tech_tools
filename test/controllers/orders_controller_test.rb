require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get confirmation" do
    get orders_confirmation_url
    assert_response :success
  end
end
