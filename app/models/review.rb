class Review < ApplicationRecord
  # Associations
  belongs_to :product

  # Validations
  validates :title, :author, :content_body, :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :content_body, length: { in: 50..250 }

  # Callbacks
end