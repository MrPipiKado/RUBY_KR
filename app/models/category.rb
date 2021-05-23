class Category < ApplicationRecord
  has_many :posts, dependent: :nullify
  validates :name, presence: true
  validates :name, length: { within: 5..50 }
end
