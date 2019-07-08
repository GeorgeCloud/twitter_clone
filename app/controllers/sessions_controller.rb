class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # User log in and redirect_to
      log_in(user)
      redirect_to user_url(user)
    else
      # Prompt User error_message
      flash.now[:danger] = "hello world"
      render 'new'
    end
  end

  def destroy
  end
end
