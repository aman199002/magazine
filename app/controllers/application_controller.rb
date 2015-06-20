class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_filter :require_user

  def require_user
  	unless current_user
  		redirect_to login_path
  	end	
  end	
  
  private
  def current_user
    @current_user ||= User.find_by_email(session[:user_email]) if session[:user_email]
  end

end
