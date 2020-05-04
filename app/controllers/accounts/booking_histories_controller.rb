class Accounts::BookingHistoriesController < ApplicationController
  def index
  end

  def new
    @booking_history = BookingHistory.new
    @restaurant_id = params[:restaurant_id]
    @restaurant_name = params[:restaurant_name]
    @date = params[:date]
    @time = params[:time]
    @people_count = params[:people_count]
  end

  def create
    @booking_history = BookingHistory.new(booking_history_params)
    @booking_history.account_id  = current_account.id
    @booking_history.reservation_number = SecureRandom.hex(16)
    @booking_history.save

    respond_to do |format|
      if @booking_history.save
        format.html { redirect_to @booking_history, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking_history }
        # 追加
        format.js { @status = "success" }
      else
        format.html { render :new }
        format.json { render json: @booking_history.errors, status: :unprocessable_entity }
        # 追加
        format.js { @status = "fail" }
      end
    end
  end

  private
  def booking_history_params
      params.require(:booking_history).permit(:date, :people_count, :notes)
  end
end