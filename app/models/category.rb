class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_transactions
  has_many :transactions, through: :category_transactions

  validates :name, presence: true
  validates :icon, presence: true
end
