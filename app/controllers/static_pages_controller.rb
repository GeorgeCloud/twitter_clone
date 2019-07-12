class StaticPagesController < ApplicationController
  def exit_error
    render html: "Error Escape"
  end

  def contact
  end

  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def login
  end
end
