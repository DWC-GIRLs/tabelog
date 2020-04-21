class Accounts::SearchController < ApplicationController
  def area
  end

  def keyword
    @restaurants = Restaurant.search_by_keyword(params[:q])
    render template: "accounts/restaurants/index"
  end

  def genre
  end

  def booking
  end

  def detail
  end
end
