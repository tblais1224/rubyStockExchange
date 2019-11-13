class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action runs method before anything else is done
  before_action :authorized
  # make methods accessible to Views with helper_method
  helper_method :current_user
  # ending a method with ? means its returning a true or false
  helper_method :logged_in?

  def authorized
    redirect_to '/welcome' unless logged_in?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    # nil means lack of an object
    !current_user.nil?
  end

end
