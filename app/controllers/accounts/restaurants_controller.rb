class Accounts::RestaurantsController < ApplicationController
  def show
  end

  def index
    @restaurants = Restaurant.all
  end
end
