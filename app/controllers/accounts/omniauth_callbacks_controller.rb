# frozen_string_literal: true

class Accounts::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    account = Account.find_omniauth(request.env["omniauth.auth"])
    if account.persisted? #DBに保存済みか（オブジェクトが新しくない&&削除されてない場合にtrue）
      sign_in_and_redirect account, event: :authentication #サインイン後、保存された場所にリダイレクトしてから、after_sign_in_path_forで指定されたURLにリダイレクト
      set_flash_message(:notice, :success, kind: "#{account.provider}".capitalize) if is_navigational_format? #.capitalize(先頭のみ大文字)
    else # transaction発火したら
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra") #extraは除く
      redirect_to new_user_registration_url
    end
  end

  # find_omniauth 失敗時
  def failure
    flash[:notice] = "SNS認証に失敗しました"
    redirect_to root_path
  end

end
