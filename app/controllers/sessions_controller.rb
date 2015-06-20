class SessionsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :require_user

  def new
  end	

  def create
    # raise request.env["omniauth.auth"].to_yaml
    auth_hash = request.env['omniauth.auth']
	session[:user_email] = auth_hash['info']['email']
    redirect_to root_path
  end

  def failure
  	session[:user_email] = nil
    redirect_to login_path
  end  

  	
end
