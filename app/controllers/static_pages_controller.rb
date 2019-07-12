class StaticPagesController < ApplicationController
  def exit_error
    render html: "Error Escape"
  end

  def contact
  end

  def home
    @micropost = current_user.microposts.build if logged_in?
  end

  def help
  end

  def about
  end

  def login
  end
end
