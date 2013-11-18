class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         omniauth_providers: [:github, :facebook, :twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :authorizations

  def self.from_omniauth(auth)
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid).first
    if authorization.present?
      authorization.user
    else
      User.find_or_initialize_by_email(auth.info.email, name: auth.extra.raw_info.name, password: Devise.friendly_token[0,20]).tap do |u|
        u.authorizations.build provider: auth.provider, uid: auth.uid
      end
    end
  end
end
