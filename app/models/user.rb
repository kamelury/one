class User < ActiveRecord::Base
  has_many :authentications, :dependent => :delete_all
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
 
  def apply_omniauth(omniauth)
    self.email = omniauth['user_info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], 
                          :uid => omniauth['uid'], 
                          :token => (omniauth['credentials']['token'] rescue nil),
                          :secret => (omniauth['credentials']['secret'] rescue nil))
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
