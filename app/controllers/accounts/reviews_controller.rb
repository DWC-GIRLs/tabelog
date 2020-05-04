class Accounts::ReviewsController < ApplicationController
  def index
  end

  def new #モーダル(jsファイル参照)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.account_id = current_account.id
    @review.restaurant_id = params[:restaurant_id]
    respond_to do |format|
      if @review.save
        format.html { redirect_back(fallback_location: root_path) }
        format.js { @status = "success" }
      else
        format.html { render "new" }
        format.js { @status = "fail" }
      end
    end
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
