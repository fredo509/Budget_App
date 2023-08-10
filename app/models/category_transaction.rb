class CategoryTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :transac, class_name: 'Transaction'
end