class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories
  has_many :categories, through: :category_id

  validates :name, presence: true
  validates :amount, presence: true
end
