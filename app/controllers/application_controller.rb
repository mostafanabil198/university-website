class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  before_action :require_user

  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:notice] = "you don't have access to this page, login first"
      redirect_to login_path
    end
  end
end
