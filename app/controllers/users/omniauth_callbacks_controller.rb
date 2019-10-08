class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :assign_user, only: [:google_oauth2, :facebook]

  def google_oauth2
    binding.pry
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.google_access_token"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def facebook
    binding.pry
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.facebook_access_token"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  private

  def assign_user
    access_token = request.env['omniauth.auth']
    provider = Provider.find_by(name: access_token.provider)
    @user = current_user || User.where('uid_facebook = ? OR uid_google = ?', access_token.uid, access_token.uid).first
    unless @user
      binding.pry
      password = Devise.friendly_token[0,20]
      @user = User.create(name: access_token.info["name"],
        email: access_token.info['email'],
        password: password, password_confirmation: password
      )
    end
    binding.pry

    case provider.name
    when 'facebook'
      @user.update_attributes(uid_facebook: access_token.uid)
    when 'google_oauth2'
      @user.update_attributes(uid_google: access_token.uid)
    end
  end
end
