class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Successfully signed in via #{request.env["omniauth.auth"].provider}!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      session['omniauth.biz'] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  Devise.omniauth_configs.keys.each do |service|
    alias_method service, :all
  end
end