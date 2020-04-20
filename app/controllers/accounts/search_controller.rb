class Accounts::SearchController < ApplicationController

  def area
    @restaurants = Restaurant.search_area(params[:search])
  end

  def keyword
  end

  def genre
    @restaurants = Restaurant.search_genre(params[:genre_name])
  end

  def booking
  end

  def detail
  end
end
