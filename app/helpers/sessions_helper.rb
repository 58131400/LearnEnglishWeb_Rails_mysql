module SessionsHelper
  def log_in user
    session[:userID] = user.UserID
  end
  def log_out
    reset_session
  end
  def current_user
    @current_user ||= User.find_by_UserID session[:userID]
  end
  # Check user has logged in before ?
  def logged_in?
    current_user.present?
  end
end
