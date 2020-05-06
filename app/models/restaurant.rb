class Restaurant < ApplicationRecord
  belongs_to :owner

  has_many :booking_histories, dependent: :destroy
  has_many :rates,            dependent: :destroy
  has_many :reviews,          dependent: :destroy
  has_many :restaurant_images,    dependent: :destroy

  attachment :logo_image
  accepts_attachments_for :restaurant_images, attachment: :image

  class << self
    def search_by_area_codes(area_codes)
      area_resutlts = area_codes.map{|code| Restaurant.where(s_area_code: code)}
      if area_resutlts.size == 0
        return false
      else
        return area_resutlts
      end
    end

    def search_by_area(area_q_array)
      results = []
      target_columns = ["station_name", "address", "access"]

      # exact_match
      area_q_array.each do |area_q|
        target_columns.each do |column|
          results += self.search_type_exact_match(column, area_q)
        end
      end

      # phrase_match
      area_q_array.each do |area_q|
        target_columns.each do |column|
          results += self.search_type_phrase_match(column, area_q)
        end
      end

      # broad_match
      area_q_array.each do |area_q|
        target_columns.each do |column|
          results += self.search_type_broad_match(column, area_q)
        end
      end

      last_results = results.flatten.uniq
      return last_results
    end

    def search_by_keyword(keyword_q_array)
      results = []
      target_columns = ["name", "name_kana", "genre_name", "search_keyword", "catch"]

      # exact match
      keyword_q_array.each do |area_q|
        target_columns.each do |column|
          results += self.search_type_exact_match(column, area_q)
        end
      end

      # phrase_match
      keyword_q_array.each do |area_q|
        target_columns.each do |column|
          results += self.search_type_phrase_match(column, area_q)
        end
      end

      # broad_match
      keyword_q_array.each do |area_q|
        target_columns.each do |column|
          results += self.search_type_broad_match(column, area_q)
        end
      end

      last_results = results.flatten.uniq
      return last_results
    end

    def search_genre(genre)
      return Restaurant.all unless genre
      Restaurant.where(['genre_name LIKE ?', "%#{genre}%"])
    end

    def search_type_exact_match(column, q) # 完全一致
      return Restaurant.where(["#{column} LIKE ?", "#{q}"])
    end

    def search_type_phrase_match(column, q) # フレーズ一致
      return phrase_match = Restaurant.where(["#{column} LIKE ?", "%#{q}%"])
    end

    def search_type_broad_match(column, q) # 部分一致
      splited_q = q.split(/\s*/)
      search_broad_match = splited_q.map{|q| Restaurant.where(["#{column} LIKE ?", "%#{q}%"])}
      return search_broad_match.flatten.uniq
    end
  end
end
