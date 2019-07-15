class SessionsController < ApplicationController
  def new
  end

  def create
    # debugger
    user = User.find_by(email: params[:session][:email].downcase)
    user.toggle!(:activated)
    if user && user.authenticate(params[:session][:password])
      # User log in and redirect_to
      if user.activated?
        log_in(user)
        remember(user) if params[:session][:remember_me] == '1'
        redirect_back_or user
      else
        flash[:warning] = "Your Account has not been validated. Check your email."
        redirect_to root_url
      end
    else
      # Prompt User error_message
      flash.now[:danger] = "Log in credentials incorrect"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
