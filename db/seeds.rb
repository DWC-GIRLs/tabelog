require 'net/http'
require 'json'
require 'pry'
require 'dotenv'
Dotenv.load


uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV['RESTAURANT_API_KEY']}&count=1000&name=a&format=json")
response = Net::HTTP.get(uri)
parsed_response = JSON.parse(response)
shops = parsed_response["results"]["shop"]
shops.each do |shop|

    wifi = shop['wifi'].include?("あり") ? 1 : 0
    free_drink = shop['free_drink'].include?("あり ") ? 1 : 0
    free_food = shop['free_food'].include?("あり ") ? 1 : 0
    private_room = shop['private_room'].include?("あり ") ? 1 : 0
    horigotatsu = shop['horigotatsu'].include?("あり ") ? 1 : 0
    tatami = shop['tatami'].include?("あり ") ? 1 : 0
    card = shop['card'].include?("利用可") ? 1 : 0
    non_smoking = shop['non_smoking'].include?("全面禁煙") ? 1 : 0
    charter = shop['charter'].include?("貸切可 ") ? 1 : 0
    parking = shop['parking'].include?("あり ") ? 1 : 0
    barrier_free = shop['barrier_free'].include?("あり ") ? 1 : 0
    karaoke = shop['karaoke'].include?("あり") ? 1 : 0
    tv = shop['tv'].include?("あり") ? 1 : 0
    english = shop['english'].include?("あり") ? 1 : 0
    pet = shop['pet'].include?("可") ? 1 : 0
    child = shop['child'].include?("お子様連れ不可 ") ? 0 : 1
    lunch = shop['lunch'].include?("あり") ? 1 : 0
    midnight = shop['midnight'].include?("営業している") ? 1 : 0


    Restaurant.create!(
    shop_id: shop['id'],
    name: shop['name'],
    logo_image_id: shop['logo_image'],
    name_kana: shop['name_kana'],
    address: shop['address'],
    station_name: shop['station_name'],
    l_area_code: shop['large_area']['code'],
    m_area_code: shop['middle_area']['code'],
    s_area_code: shop['small_area']['code'],
    lat: shop['lat'],
    lng: shop['lng'],
    genre_code: shop['genre']['code'],
    genre_name: shop['genre']['name'],
    search_keyword: shop['genre']['catch'],
    catch: shop['catch'],
    capacity: shop['capacity'],
    access: shop['access'],
    urls: shop['urls']['pc'],
    open: shop['open'],
    close: shop['close'],
    party_capacity: shop['party_capacity'],
    wifi: wifi,
    free_drink: free_drink,
    free_drink_memo: shop['free_drink'].sub!(/.+(?=：)：+/, ""),
    free_food: free_food,
    free_food_memo: shop['free_food'].sub!(/.+(?=：)：+/, ""),
    private_room: private_room,
    private_room_memo: shop['private_room'].sub!(/.+(?=：)：+/, ""),
    horigotatsu: horigotatsu,
    horigotatsu_memo: shop['horigotatsu'].sub!(/.+(?=：)：+/, ""),
    tatami: tatami,
    tatami_memo: shop['tatami'].sub!(/.+(?=：)：+/, ""),
    card: card,
    non_smoking: non_smoking,
    charter: charter,
    charter_memo: shop['charter'].sub!(/.+(?=：)：+/, ""),
    parking: parking,
    parking_memo: shop['parking'].sub!(/.+(?=：)：+/, ""),
    barrier_free: barrier_free,
    barrier_free_memo: shop['barrier_free'].sub!(/.+(?=：)：+/, ""),
    karaoke: karaoke,
    tv: tv,
    english: english,
    pet: pet,
    child: child,
    child_memo: shop['child'].sub!(/.+(?=：)：+/, ""),
    lunch: lunch,
    midnight: midnight,
    other_memo: shop['other_memo'],
    shop_detail_memo: shop['shop_detail_memo'],
    coupon_urls: shop['coupon_urls']['pc']
    )
end
