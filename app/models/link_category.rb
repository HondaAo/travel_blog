class LinkCategory < ApplicationRecord
  def self.batch_insert(category_ids, post_id)
    hash_array = []
    category_ids.each do |id|
      hash_array.push({ category_id: id, post_id: post_id })
    end
    LinkCategory.insert_all(hash_array)
  end
end