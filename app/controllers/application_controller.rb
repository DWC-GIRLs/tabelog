class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource_or_scope)
    owners_mypage_path(current_owner)
  end

  def after_sign_out_path_for(resource_or_scope)
    new_owner_session_path
  end
end
