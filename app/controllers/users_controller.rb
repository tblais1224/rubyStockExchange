class UsersController < ApplicationController

  # new and create will skip the authorized method as they dont require login
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    params.require(:user)["cash"] = 0.00
    @user = User.new(params.require(:user).permit(:username, :password, :cash))

    @existingUser = User.find_by(username: @user.username)
    if @existingUser
      puts @user.errors.full_messages
      puts "llllllllllllllllllllllllllllllll"
      redirect_to 'new', alert: @user.errors.full_messages
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      render 'new'
    end
  end

end
