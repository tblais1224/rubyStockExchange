class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login', :flash => { :error => "Invalis Credentials!" }
    end
  end

  def page_requires_login
  end
  
  def logout
    
    session.delete(:user_id)
    redirect_to '/'

  end

  def login
  end

  def welcome
  end
end
