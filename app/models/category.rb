class Category < ActiveRecord
  has_many :posts, dependent: :nullify
end
