class StocksController < ApplicationController

  def new
  end

  def quote
    redirect_to quote_path(symbol: params.require(:symbol).upcase)
  end

  def quoted
    @stock = Stock.new(params[:symbol])
    @price = @stock.get_quote_price()
    @name = @stock.get_quote_name()
  end

  def buy
  end

  def sell
  end
end
