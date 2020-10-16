require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'cereal'
    fill_in 'Cost', :with => 5
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    # Tests for flash notice message
    expect(page).to have_content 'Product successfully created!'
    # Tests that product name listed on products page
    expect(page).to have_content 'Cereal'
  end

  it "gives and error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    # Tests for flash alert message
    expect(page).to have_content 'There was an error. Please try again.'
    # Tests for validation error message
    expect(page).to have_content 'Name can\'t be blank'
  end
end