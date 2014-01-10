module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_token(session[:token])
  end

  def log_in_user!(user)
    session[:token] = user.token
  end

  def log_out_user!
    current_user.reset_token!
    session[:token] = nil
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    redirect_to new_session_url unless logged_in?
  end

end
