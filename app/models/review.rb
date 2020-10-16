class Review < ApplicationRecord
  # Associations
  belongs_to :product

  # Validations
  # Validations
  validates :title, :author, :content_body, :rating, presence: true
end