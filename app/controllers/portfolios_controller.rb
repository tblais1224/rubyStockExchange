class PortfoliosController < ApplicationController

  def show
    @portfolio = Portfolio.where(user_id: session[:user_id]).all
    @totalPortfolioValue = 0
    @portfolio.each do |stock|
      @newStock = Stock.new(stock.symbol)
      stock['total'] = (@newStock.get_quote_price() * stock.shares).round(2)
      @totalPortfolioValue += stock.total
    end
    @portfolio
  end

  def add_cash
    if !params[:cash].present?
      redirect_to portfolio_path, :flash => { :error => "Enter a valid amount of cash to add." }
      return 0
    end
    @user = User.find_by(id: session[:user_id])
    @amount = params.require(:cash).to_f
    @cash = (@user["cash"] + @amount).round(2)
    @user.cash = @cash
    @user.save(:validate => false)
    redirect_to '/portfolio'
  end

  def withdraw_cash
    if !params[:cash].present?
      redirect_to portfolio_path, :flash => { :error => "Enter a valid amount of cash to withdraw." }
      return 0
    end
    @user = User.find_by(id: session[:user_id])
    @amount = params.require(:cash).to_f
    @cash = (@user["cash"] - @amount).round(2)
    @user.cash = @cash
    @user.save(:validate => false)    
    redirect_to '/portfolio'
  end
end
