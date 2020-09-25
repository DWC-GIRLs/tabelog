class Accounts::BookingHistoriesController < ApplicationController
  def index
  end

  def new
    @booking_history = BookingHistory.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @date = params[:date]
    @time = params[:time]
    @people_count = params[:people_count]
  end

  def create
    @booking_history = BookingHistory.new(booking_history_params)
    @booking_history.account_id  = current_account.id
    @booking_history.restaurant_id = params[:booking_history][:restaurant_id]
    @booking_history.reservation_number = SecureRandom.hex(16)
    @booking_history.date = params[:booking_history][:date]
    @booking_history.people_count = params[:booking_history][:people_count]
    @booking_history.time = params[:booking_history][:time]

    if @booking_history.save
      @status = "success"
    else
      @status = "fail"
    end
  end

  private
  def booking_history_params
      params.require(:booking_history).permit(:notes)
  end
end