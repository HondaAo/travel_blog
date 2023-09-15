class LinkCity < ApplicationRecord
  def self.batch_insert(city_ids, post_id)
    hash_array = []
    city_ids.each do |id|
      hash_array.push({ city_id: id, post_id: post_id })
    end
    LinkCity.insert_all(hash_array)
  end
end