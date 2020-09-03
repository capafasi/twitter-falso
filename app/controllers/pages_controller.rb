class PagesController < ApplicationController
  
  def index
    if signed_in?
      @tweets = Tweet.tweets_for_me(current_user).order("created_at DESC").page params[:page]
      @tweet = Tweet.new
    else
    @tweets = Tweet.order("created_at DESC").page params[:page]
    
    end

  end

  def all_tweets
    @tweets = Tweet.order("created_at DESC").page params[:page]
    @tweet = Tweet.new

    render :template => "pages/index"
    
  end
end
