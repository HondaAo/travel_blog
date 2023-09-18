class Country < ApplicationRecord
  has_many :posts
  belongs_to :region
end