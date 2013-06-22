class ApplicationController < ActionController::Base
  protect_from_forgery

  private 

  def build_google_reader_client
    if current_user.access_token_expired_at
      if current_user.access_token_expired_at > Time.now
        @google_client = GoogleReaderApi::User.new({auth: current_user.access_token}) 
        @google_api = GoogleReaderApi::Api.new({auth: current_user.access_token})       
      else
        sign_out(current_user)
        redirect_to root_url
      end
    else
      sign_out(current_user)
      redirect_to root_url
    end
  end

  def username  	
		@user = User.find(current_user)
  end
end
