class StocksController < ApplicationController

  def new
  end

  def quote
    redirect_to quote_path(symbol: params.require(:symbol).upcase)
  end

  def quoted
    @symbol = params[:symbol]  
    begin
      @stock = Stock.new(@symbol)
    rescue
      redirect_to '/quote/new', :flash => { :error => "Invalid Stock Symbol" }
      return
    end

    @price = @stock.get_quote_price()
    @name = @stock.get_quote_name()
  end

  def buy
    @symbol = params.require(:symbol).upcase
    @shares = params.require(:shares).to_i
    @stock = Stock.new(@symbol)
    @portfolio = @stock.buy_stock(@shares, session[:user_id])
    
    if @portfolio === "insufficient funds"
      redirect_to quote_path(symbol: @symbol), :flash => { :error => "Insufficient Funds" }
    else
      @history = History.new(
        symbol: @symbol,
        shares: @shares,
        price: @stock.get_quote_price(),
        total: (@stock.get_quote_price() * @shares).round(2),
        buy_sell_type: "buy",
        user_id: session[:user_id]
      )
      @history.save
      redirect_to '/portfolio'
    end
  end

  def sell
    @symbol = params.require(:symbol).upcase
    @shares = params.require(:shares).to_i
    @stock = Stock.new(@symbol)
    @portfolio = @stock.sell_stock(@shares, session[:user_id])

    @history = History.new(
      symbol: @symbol,
      shares: @shares,
      price: @stock.get_quote_price(),
      total: (@stock.get_quote_price() * @shares).round(2),
      buy_sell_type: "sell",
      user_id: session[:user_id]
    )
    @history.save

    if @portfolio === false
      redirect_to quote_path(symbol: @symbol)
    else
      redirect_to '/portfolio'
    end
  end

end
