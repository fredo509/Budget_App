class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }

end
