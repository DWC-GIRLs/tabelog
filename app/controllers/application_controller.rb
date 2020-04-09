class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource_or_scope)
    owners_mypage_path(current_owner)
  end

  def after_sign_out_path_for(resource_or_scope)
    new_owner_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:status, :first_name, :last_name, :first_kana, :last_kana, :nick_name, :phone_number, :password, :password_confirmation])
  end  
end
