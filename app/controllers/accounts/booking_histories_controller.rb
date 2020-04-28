class Accounts::BookingHistoriesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @booiking_history = BookingHistory.new(booiking_history)
  end

  private
  def booking_history_params
      params.require(:booking_history).permit(:date, :people_count, :notes)
  end
end