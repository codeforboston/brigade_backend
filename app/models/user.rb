class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: Setup.omniauth.map(&:provider)

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :authorizations, dependent: :destroy
  accepts_nested_attributes_for :authorizations

  def self.from_omniauth(auth)
    authorization = Authorization.where(auth.slice(:provider, :uid)).first
    if authorization.present?
      authorization.user
    else
      User.find_or_initialize_by_email(auth.info.email, name: auth.extra.raw_info.name, password: Devise.friendly_token[0,20]).tap do |u|
        u.authorizations.build provider: auth.provider, uid: auth.uid
        u.confirmed_at ||= Time.now if u.valid? # no need for user confirmation if their credentials come from a reputable source
        u.save
      end
    end
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
end
