class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to:category
  
  validates :name, presence: true
  validates :amount, presence: true

end
