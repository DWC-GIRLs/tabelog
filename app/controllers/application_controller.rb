class ApplicationController < ActionController::Base
  #ログイン後の画面遷移
  def after_sign_in_path_for(resource)
    root_path
  end
  #ログアウト後の画面遷移
  def after_sign_out_path_for(resource)
    root_path
  end
end
