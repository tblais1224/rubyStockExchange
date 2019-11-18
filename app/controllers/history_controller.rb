class HistoryController < ApplicationController
  def show_buy
    @history = History.where(user_id: session[:user_id], buy_sell_type: "buy").all
  end

  def show_sell
    @history = History.where(user_id: session[:user_id], buy_sell_type: "sell").all
  end
end
