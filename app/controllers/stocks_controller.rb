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
    @shares = params.require(:shares).to_i
    @name = @stock.get_quote_name
    @total = @stock.get_quote_price.to_f
    @user_id = session[:user_id]

    @portfolio = Portfolio.new(
      symbol: @symbol,
      user_id: @user_id,
      total: @total,
      name: @name,
      shares: @shares)

    if @portfolio.save
      redirect_to '/portfolio/show'
    else
      redirect_to '/quote'
    end
  end

  def sell
  end

end
