class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後の画面遷移
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Account)
      root_path
    else
      owners_mypage_path(current_owner)
    end
  end

  #ログアウト後の画面遷移
  def after_sign_out_path_for(resource_or_scope)
    case resource_or_scope
    when :owner
      new_owner_session_path
    when :account
      logout_accounts_path
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:email, :nick_name, :profile_image, :password]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

end
