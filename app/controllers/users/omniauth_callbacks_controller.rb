class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :assign_user, only: [:google_oauth2, :facebook]

  def google_oauth2
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.google_access_token"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def facebook
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
    @user = current_user || User.where('uid_facebook = ? OR uid_google = ?', access_token.uid, access_token.uid).first
    @user = create_new_user(access_token) unless @user
    update_provider(access_token.provider)
    case access_token.provider
    when 'facebook'
      @user.update_attributes(uid_facebook: access_token.uid)
    when 'google_oauth2'
      @user.update_attributes(uid_google: access_token.uid)
    end
  end

  def create_new_user(access_token)
    password = Devise.friendly_token[0,20]
    user = User.create!(name: access_token.info["name"],
      email: access_token.info['email'],
      password: password, password_confirmation: password
    )
  end

  def update_provider(provider_name)
    provider = Provider.find_by(name: provider_name)
    return unless UserProvider.where('provider_id =  ? and user_id = ?', provider.id, @user.id).empty?

    user_provider = UserProvider.new(provider_id: provider.id, user_id: @user.id)
    @user.user_providers << user_provider
    provider.user_providers << user_provider
  end
end
