class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # User log in and redirect_to
      log_in user
      # remember user
      remember(user) if params[:session][:remember_me] == '1'
      redirect_to user_url(user)
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
