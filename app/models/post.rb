class Post < ApplicationRecord
  belongs_to :category

  scope :ordered, -> { order(id: :desc)}
  scope :with_categories, -> {includes(:category)}
  # Ex:- scope :active, -> {where(:active => true)}
end
