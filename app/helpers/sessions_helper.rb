module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user?(user)
    user == current_user
  end

  def current_user

    if (user_id = session[:user_id])                              # New Session
      @current_user ||= User.find_by(id: user_id)                 # Validate everytime current_user is active
    elsif (user_id = cookies.signed[:user_id])                    # Get Cookies(previous_session) then Login & current_user
      user = User.find_by(id: user_id)
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
    user.forget                            # From User model: (OBJ).forget
    cookies.delete(:user_id)               # cookies.permanent.signed[:user_id] = nil
    cookies.delete(:remember_token)        # cookies.permanent[:remember_token] = nil
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
