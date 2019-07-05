class StaticPagesController < ApplicationController
  def exit_error
    render html: "Error Escape"
  end

  def contact
  end

  def home
    return "__home__"
  end

  def help
  end

  def about
  end
end
