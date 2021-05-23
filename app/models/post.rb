class Post < ApplicationRecord
  belongs_to :category

  scope :ordered, -> { order(id: :desc)}
  scope :with_categories, -> {includes(:category)}
  scope :search_by_starts_with, -> (title) { where("title like ?", "#{title}%")}
  # Ex:- scope :active, -> {where(:active => true)}models
  validates :title, :text, :category_id, presence: true
  validates :title, length: { within: 5..50 }
end
