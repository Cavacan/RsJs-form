class Post < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :name, presence: true, uniqueness: true
  validates :body, presence: true
end
