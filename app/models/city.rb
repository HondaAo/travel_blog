class City < ApplicationRecord
  has_many :posts
  belongs_to :country
end