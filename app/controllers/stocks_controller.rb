class StocksController < ApplicationController

  def new
  end

  def quote
    redirect_to quote_path(symbol: params.require(:symbol).upcase)
  end

  def quoted
    @symbol = params[:symbol]
    @stock = Stock.new(@symbol)
    @price = @stock.get_quote_price()
    @name = @stock.get_quote_name()
  end

  def buy
    @symbol = params.require(:symbol).upcase
    @stock = Stock.new(@symbol)
    @portfolio = @stock.buy_stock(params.require(:shares).to_i, session[:user_id])

    if @portfolio === "insufficient funds"
      redirect_to quote_path(symbol: @symbol)
    else
      redirect_to '/portfolio'
    end
  end

  def sell
  end

end
