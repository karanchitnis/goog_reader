require "google_reader_api"

class DashboardController < ApplicationController
  before_filter :authenticate_user!, :build_google_reader_client, :get_subscriptions, :get_new_token, :username

  def index   	
    @items = @subscriptions.first.items rescue nil     
  end

  def get_feed_items  	
		feed = @google_client.feed(params[:url])				
		@items = feed.items rescue nil 		
  end
 
  def add_subscription  	
  	if params[:rss].empty?
  		redirect_to root_url, notice: "rss feed could not be empty"
		else				
	    @subscriptions = @google_api.post_link 'api/0/subscription/edit', s: "feed/#{params[:rss]}" , ac: :subscribe, T: @new_token   
	    redirect_to root_url
	  end
  end

  def delete_subscription	
		@subscriptions = @google_api.post_link 'api/0/subscription/edit', s: "feed/#{params[:url]}" , ac: :unsubscribe, T: @new_token	
		redirect_to root_url			
  end

  private

  def get_subscriptions
    @subscriptions = @google_client.feeds   
  end

  def get_new_token
		@new_token = @google_api.get_link "api/0/token"
  end
end
