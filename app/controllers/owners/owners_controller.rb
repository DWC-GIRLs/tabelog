class Owners::OwnersController < ApplicationController
  def mypage
    @page_title = "#{current_owner.fullname}さんのマイページ"
    @restaurants = current_owner.restaurants
  end

  def edit
    @page_title = "登録情報変更ページ"
  end

  def update
    if current_owner.update(owner_params)
      redirect_to owners_mypage_path(current_owner)
      flash[:notice] = "オーナー情報が正常に更新されました。"
    else
      render :edit
    end
  end

  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name,
                                  :first_kana, :last_kana,
                                  :phone_number)
  end
end
