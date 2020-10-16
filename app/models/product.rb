class Product < ApplicationRecord
  # Assopciations
  has_many :reviews, dependent: :destroy

  # Validations
  validates :name, :cost, :country_of_origin, presence: true

  # Scopes
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviewed, -> {(
    select("products.*, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}
end