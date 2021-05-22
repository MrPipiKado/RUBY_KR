class Post < ApplicationRecord
  belongs_to :category

  scope :ordered, -> { order(id: :desc)}
  scope :with_categories, -> {includes(:category)}
  scope :search_by_starts_with, -> (title) { where("title like ?", "#{title}%")}
  # Ex:- scope :active, -> {where(:active => true)}
end
