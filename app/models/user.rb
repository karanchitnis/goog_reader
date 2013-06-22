class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :access_token, :access_token_expired_at, :refresh_token
  # attr_accessible :title, :body

  def self.find_for_google_oauth2(data, signed_in_resource=nil)
    user = User.where(:email => data.extra.raw_info.email).first

    if user
      user.update_attributes(access_token: data.credentials.token, 
        access_token_expired_at: Time.at(data.credentials.expires_at),
        refresh_token: data.credentials.refresh_token
        )
    else
      user = User.create(name: data.extra.raw_info.name,
        email: data.extra.raw_info.email,
        password: Devise.friendly_token[0,20],
        access_token: data.credentials.token,
        access_token_expired_at: Time.at(data.credentials.expires_at),
        refresh_token: data.credentials.refresh_token
      )
    end
    user
  end
end
