class Owners::OwnersController < ApplicationController
  def mypage
    @restaurants = current_owner.restaurants
  end

  def edit
  end

  def update
  end
end
