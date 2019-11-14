require 'test_helper'

class PortfolioControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get portfolio_new_url
    assert_response :success
  end

  test "should get show" do
    get portfolio_show_url
    assert_response :success
  end

  test "should get history" do
    get portfolio_history_url
    assert_response :success
  end

end
