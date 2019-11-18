class HistoryController < ApplicationController
  def show_buy
    @history = History.where(user_id: session[:user_id], buy_sell_type: "buy").all.order('created_at DESC')
  end

  def show_sell
    @history = History.where(user_id: session[:user_id], buy_sell_type: "sell").all.order('created_at DESC')
  end
end
