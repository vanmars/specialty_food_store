require 'rails_helper'

describe Product do
  # Associations
  it { should have_many(:reviews) }

  # Validations
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }

end