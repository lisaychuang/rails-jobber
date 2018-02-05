class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    session.include? :user_id
  end
  helper_method :logged_in?

  def require_login
    # return head(:forbidden) unless session.include? :user_id    
    unless logged_in?  
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/login'
    end
  end
  helper_method :require_login

  def authorize
    redirect_to '/login' unless current_user
  end
 
  
end
