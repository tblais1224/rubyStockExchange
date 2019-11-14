require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get quote" do
    get stocks_quote_url
    assert_response :success
  end

  test "should get buy" do
    get stocks_buy_url
    assert_response :success
  end

  test "should get sell" do
    get stocks_sell_url
    assert_response :success
  end

end
