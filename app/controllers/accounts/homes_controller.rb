class Accounts::HomesController < ApplicationController
  def top
    @areas = ["東京", "神奈川", "愛知", "大阪", "京都", "福岡"]
    @hokkaido = ["北海道", "青森", "秋田", "山形", "岩手", "宮城", "福島"]
    @tyubu = ["愛知", "岐阜", "静岡", "三重", "新潟", "山梨", "長野", "石川", "富山", "福井"]
    @tyugoku = ["岡山", "広島", "鳥取", "島根", "山口", "香川", "徳島", "愛媛", "高知"]
    @kanto = ["東京", "神奈川", "埼玉", "千葉", "栃木", "茨城", "群馬"]
    @kansai = ["大阪", "兵庫", "京都", "滋賀", "奈良", "和歌山"]
    @okinawa = ["福岡", "佐賀", "長崎", "熊本", "大分", "宮崎", "鹿児島", "沖縄"]
    @genres = ["焼肉", "寿司", "居酒屋", "イタリアン", "ラーメン", "カフェ"]
    tags = Restaurant.limit(36).pluck("genre_name")# レストラン36件分のgenre_nameを取得
    @tags = tags.uniq - @genres# 重複したジャンルからメインジャンル除く
  end

  def about
  end
end
