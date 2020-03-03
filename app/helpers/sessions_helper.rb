module SessionsHelper
  def log_in(user)
    # This is putting an encrypted version of the user's id in
    # to the session in the browser
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    # This checks if the current user is not nil?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end

