class User < ActiveRecord::Base
  belongs_to :role
 
  delegate :can?, :cannot?, :to => :ability
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter]
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.twitter_data"]
        user.provider = data["provider"]
        user.uid = data["uid"]
      end
    end
  end

  def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def ability
    @ability ||= Ability.new(self)
  end

  def is_admin?
    if self.role
     self.role.permissions.fetch(:all, false)
    end
  end
end
