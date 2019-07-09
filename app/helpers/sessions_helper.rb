module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    # New Session
    if session[:user_id]
      # Validate everytime current_user is active
      @current_user ||= User.find_by(id: session[:user_id])
    # Check Cookies for persistent user / Log in & make current_user
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    # From User model: (OBJ).forget
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    # cookies.permanent.signed[:user_id] = nil
    # cookies.permanent[:remember_token] = nil
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
