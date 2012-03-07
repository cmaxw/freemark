class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_user
    @current_user ||= User.get(session[:username])
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
