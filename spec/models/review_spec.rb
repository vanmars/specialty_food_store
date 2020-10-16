require 'rails_helper'

describe Review do
  # Associations
  it { should belong_to :product }

  # Validations
  it { should validate_presence_of :title}
  it { should validate_presence_of :author}
  it { should validate_presence_of :content_body}
  it { should validate_presence_of :rating}

  it { should validate_numericality_of(:rating).only_integer.
    is_greater_than_or_equal_to(1).
    is_less_than_or_equal_to(5)
  }
end