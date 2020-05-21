class Owners::OwnersController < ApplicationController
  def mypage
    @fullname = current_owner.first_name + "" + current_owner.last_name
    @restaurants = current_owner.restaurants
  end

  def edit
  end

  def update
  end
end
