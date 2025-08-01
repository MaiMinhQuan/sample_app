class StaticPagesController < ApplicationController
  # GET /home
  def home
    return unless logged_in?

    @micropost = current_user.microposts.build
    @pagy, @feed_items = pagy current_user.feed.newest,
                              limit: Settings.pagy.page_10
  end

  # GET /help
  def help; end

  # GET /contact
  def contact
    @name = Settings.name
  end
end
