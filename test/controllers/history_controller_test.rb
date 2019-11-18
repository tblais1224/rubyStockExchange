require 'test_helper'

class HistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get show_buy" do
    get history_show_buy_url
    assert_response :success
  end

  test "should get show_sell" do
    get history_show_sell_url
    assert_response :success
  end

end
