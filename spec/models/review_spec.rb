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
  
  it { should validate_length_of(:content_body).
    is_at_least(50).is_at_most(250)
  }

  # Callbacks
  it('titleizes the name of a review') do
    review = Review.create({title: 'peanut butter yum', author: 'Luvin P.B. Cups', content_body: 'Best peanut butter product ever!!! It melts in your mouth in a swirl of pb bliss and happiness. Do yourself a favor: try it now. You have to. You must. Seriously.', rating: 5})
    expect(review.title).to(eq('Peanut butter yum'))
  end
end