class PortfoliosController < ApplicationController

  def show

  end

  def history

  end

  def add_cash
    @user = User.find_by(id: session[:user_id])
    @amount = params.require(:cash).to_f
    @cash = (@user["cash"] + @amount).round(2)
    @user.update(cash: @cash)
    redirect_to '/portfolio'
  end

  def withdraw_cash
    @user = User.find_by(id: session[:user_id])
    @amount = params.require(:cash).to_f
    @cash = (@user["cash"] - @amount).round(2)
    @user.update(cash: @cash)
    redirect_to '/portfolio'
  end
end
