require 'net/http'
require 'json'
require 'pry'
require 'dotenv'
Dotenv.load


uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{ENV['RESTAURANT_API_KEY']}&count=100&keyword=%E4%BA%BA%E6%B0%97&format=json")
response = Net::HTTP.get(uri)
parsed_response = JSON.parse(response)
shops = parsed_response["results"]["shop"]
shops.each do |shop|

    if shop['wifi'] == "あり"
      wifi = 1
    else
      wifi = 0
    end
    if ['free_drink'] == "あり"
        free_drink = 1
    else
        free_drink = 0
    end
    if  ['free_food'] == "あり"
        free_food = 1
    else
        free_food = 0
    end
    if ['private_room'] == "あり"
        private_room = 1
    else
        private_room = 0
    end
    if ['horigotatsu'] == "あり"
        horigotatsu = 1
    else
        horigotatsu = 0
    end
    if ['tatami'] == "あり"
        tatami = 1
    else
        tatami = 0
    end
    if ['card'] == "利用可"
        card = 1
    else
        card = 0
    end
    if ['non_smoking'] == "禁煙席"
        non_smoking = 1
    else
        non_smoking = 0
    end
    if ['charter'] == "貸切可"
        charter = 1
    else
        charter = 0
    end
    if ['ktai'] == "携帯電話OK"
        ktai = 1
    else
        ktai = 0
    end
    if ['parking'] == "あり"
        parking = 1
    else
        parking = 0
    end
    if ['barrier_free'] == "あり"
        barrier_free = 1
    else
        barrier_free = 0
    end
    if ['karaoke'] == "あり"
        karaoke = 1
    else
        karaoke = 0
    end
    if ['tv'] == "あり"
        tv = 1
    else
        tv = 0
    end
    if ['english'] == "あり"
        english = 1
    else
        english = 0
    end
    if ['pet'] == "可"
        pet = 1
    else
        pet = 0
    end
    if ['child'] == "お子様連れ不可"
        child = 0
    else
        child = 1
    end
    if ['lunch'] == "あり"
        lunch = 1
    else
        lunch = 0
    end
    if ['midnight'] == "営業している"
        midnight = 1
    else
        midnight = 0
    end

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
    free_drink_memo: shop['free_drink'].sub!(/.+(?=：)：+/m, ""),
    free_food_memo: shop['free_food'].sub!(/.+(?=：)：+/m, ""),
    private_room_memo: shop['private_room'].sub!(/.+(?=：)：+/m, ""),
    horigotatsu_memo: shop['horigotatsu'].sub!(/.+(?=：)：+/m, ""),
    tatami_memo: shop['tatami'].sub!(/.+(?=：)：+/m, ""),
    charter_memo: shop['charter'].sub!(/.+(?=：)：+/m, ""),
    parking_memo: shop['parking'].sub!(/.+(?=：)：+/m, ""),
    barrier_free_memo: shop['barrier_free'].sub!(/.+(?=：)：+/m, ""),
    child_memo: shop['child'].sub!(/.+(?=：)：+/m, ""),
    other_memo: shop['other_memo'],
    shop_detail_memo: shop['shop_detail_memo'],
    coupon_urls: shop['coupon_urls']['pc']
    )
end