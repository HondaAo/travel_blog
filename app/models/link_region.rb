class LinkRegion < ApplicationRecord
  def self.batch_insert(region_ids, post_id)
    hash_array = []
    region_ids.each do |id|
      hash_array.push({ region_id: id, post_id: post_id })
    end
    RegionCountry.insert_all(hash_array)
  end
end