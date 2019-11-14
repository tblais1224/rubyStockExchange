class StocksController < ApplicationController

  def new
  end
  
  def quote
    @stock = Stock.new(params.require(:symbol).upcase)
    @price = @stock.get_quote_price()
    @name = @stock.get_quote_name()
    @openPrice = @stock.get_quote_price_open()
    redirect_to '/quote'
  end

  def buy
  end

  def sell
  end
end
