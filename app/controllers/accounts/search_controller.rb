class Accounts::SearchController < ApplicationController

  def area
    @restaurants = Restaurant.search_area(params[:search])
  end

  def keyword
    @restaurants = Restaurant.search_by_keyword(params[:q])
    render template: "accounts/restaurants/index"
  end

  def genre
    @restaurants = Restaurant.search_genre(params[:genre_name])
  end

  def booking
  end

  def detail
  end
end
