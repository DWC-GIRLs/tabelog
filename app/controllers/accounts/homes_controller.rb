class Accounts::HomesController < ApplicationController
  def top
    @areas = ["東京", "神奈川", "愛知", "大阪", "京都", "福岡"]
    @genres = ["焼肉", "寿司", "居酒屋", "イタリアン", "ラーメン", "カフェ"]
    tags = Restaurant.limit(36).pluck("genre_name")# レストラン36件分のgenre_nameを取得
    @tags = tags.uniq - @genres# 重複したジャンルからメインジャンル除く
  end

  def about
  end
end
