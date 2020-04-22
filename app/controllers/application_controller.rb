class ApplicationController < ActionController::Base

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

end
