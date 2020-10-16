require 'rails_helper'

describe Product do
  # Associations
  it { should have_many :reviews }

  # Validations
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }

  # Callbacks
  it('titleizes the name of a product') do
    product = Product.create({name: "dark chocolate peanut butter cups", cost:8, country_of_origin: "United States"})
    expect(product.name).to(eq("Dark Chocolate Peanut Butter Cups"))
  end
end