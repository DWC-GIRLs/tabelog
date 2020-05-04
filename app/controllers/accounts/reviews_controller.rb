class Accounts::ReviewsController < ApplicationController
  def index
  end

  def new #モーダル(jsファイル参照)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def rate_create
    # 星の評価
  end

  def rate_update
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment)
  end
end
