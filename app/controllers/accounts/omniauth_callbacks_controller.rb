# frozen_string_literal: true

class Accounts::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_from :facebook
  end

  # def google_oauth2
  #   account = Account.find_for_google_oauth2(request.env["omniauth.auth"])
  #   if account.persisted?
  #     flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
  #     sign_in_and_redirect account, :event => :authentication
  #   else
  #     session["devise.google_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end


  def line
    omniauth = request.env['omniauth.auth']
    if omniauth.present?
      profile = Account.find_by(provider: omniauth['provider'], uid: omniauth['uid'])
      if profile
        profile.set_values(omniauth)
        sign_in(:account, profile.account)
      else
        profile = Account.new(provider: omniauth['provider'], uid: omniauth['uid'])
        email = omniauth['info']['email'] ? omniauth['info']['email'] : Faker::Internet.email
        profile.user = current_user || Account.create!(email: email, name: omniauth['info']['name'], password: Devise.friendly_token[0, 20])
        account_profile = profile.set_values(omniauth)
        sign_in(:account, profile.account)
        redirect_to new_account_registration_path and return
      end
    end
    redirect_to root_path
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  private


end
