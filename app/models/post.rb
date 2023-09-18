class Post < ApplicationRecord
  belongs_to :user
  belongs_to :country
  belongs_to :city
  belongs_to :category
  has_many :comments
end