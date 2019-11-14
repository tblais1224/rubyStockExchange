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
    @stock = Stock.new(params.require(:symbol))
    if @stock.buy_stock?(params.require(:shares))
      redirect_to '/portfolio/show'
    else
      
    end
  end

  def sell
  end

end
