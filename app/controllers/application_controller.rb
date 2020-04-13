class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後の画面遷移
  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
    when :owner
      owners_mypage_path(current_owner)
    when :account
      root_path
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
    added_attrs = [:nick_name, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

end
