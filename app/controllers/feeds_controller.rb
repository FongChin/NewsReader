class FeedsController < ApplicationController
  before_filter :authenticate

  def index
    respond_to do |format|
      format.html { render :index }
      format.json do
        @feeds = Feed.all
        # render :json => @feeds #.to_json(include: :entries)
        @current_user_id = current_user.id
        render :index, handlers: [:rabl]
       end
    end
  end

  def create
    feed = Feed.find_or_create_by_url(params[:feed][:url])
    if feed
      render :json => feed
    else
      render :json => { error: "invalid url" }, status: :unprocessable_entity
    end
  end

  def favorite
    @user_feed = current_user.user_feeds.new({ :feed_id => params[:id] })
    if @user_feed.save
      render :json => @user_feed
    else
      render :json => { error: "cant be favorited" }, :status => 422
    end
  end
end
