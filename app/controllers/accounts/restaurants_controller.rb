class Accounts::RestaurantsController < ApplicationController
  def show
    # @account = current_account
    @restaurant = Restaurant.find(params[:id])
    # openカラムの中身
    opening_hours = @restaurant.open
    # 開店11:00の11
    opening_hr = opening_hours.scan(/\d{1,2}/)[0].to_i
    # 開店11:00の0
    opening_min = opening_hours.scan(/\d{1,2}/)[1].to_i
    # 閉店21:00の21
    closing_hr = opening_hours.scan(/\d{1,2}/)[2].to_i
    # 閉店21:00の0
    closing_min = opening_hours.scan(/\d{1,2}/)[3].to_i

    closing_hr += 24 if opening_hr >= closing_hr

    # 開店時間〜閉店時間の時間部分を配列に入れる ex)[11,12,13...]
    op_hours = [*opening_hr..closing_hr]
    @results = []
    op_hours.each do |hour|
      # 閉店時間の30分前まで繰り返す
      if hour == op_hours.last
        break
      end
      # opening_min = opening_hours.scan(/\d{1,2}/)[1].to_i
      # ex) 11:00, 12:00 時間きっかりの場合
      if opening_min == 0
        # 時間を文字に置き換え、分を最低2桁以上にして文字に変換　ex)11:00
        time = hour.to_s + ':' + format('%02d', 0)
        # 配列にpush、入れる
        @results << time
        # 30分間隔
        time = hour.to_s + ':' + format('%02d', 30)
        @results << time
      else
        # ex)11:30開店の場合
        time = hour.to_s + ':' + format('%02d', opening_min)
        @results << time
        # 12:00を作る
        hour += 1
        # 閉店時間の30分前まで繰り返す
        if hour == op_hours.last
          break
        end
        time = hour.to_s + ':' + format('%02d', 0)
        @results << time
      end
    end
  end

  def index
  end
end
