class LinkCountry < ApplicationRecord
  def self.batch_insert(country_ids, post_id)
    hash_array = []
    country_ids.each do |id|
      hash_array.push({ country_id: id, post_id: post_id })
    end
    LinkCountry.insert_all(hash_array)
  end
end