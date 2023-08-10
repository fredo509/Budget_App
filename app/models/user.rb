class User < ApplicationRecord
  has_many :categories, foreign_key: :author_id
  has_many :categories, foreign_key: :author_id

  validates :name, presence: true
end
