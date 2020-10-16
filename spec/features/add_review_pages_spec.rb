require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'cereal'
    fill_in 'Cost', :with => 5
    fill_in 'Country of origin', :with => 'United States'
    click_button 'Create Product'
    click_link 'Cereal', match: :first
    click_link 'Add a review'
    fill_in 'Title', :with => 'Avoid at all costs!'
    fill_in 'Author', :with => 'Maud L. T. Ford'
    fill_in 'Content', :with => 'Worst cereal I have ever had! Horribly rubbery texture with bland taste.'
    select 1, from: 'Rating'
    click_button 'Create Review'
    # Tests for flash notice message
    expect(page).to have_content 'Review successfully added!'
    # Tests that product name listed on products page
    expect(page).to have_content 'Avoid at all costs!'
  end

  it "gives an error when no name is entered" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'cereal'
    fill_in 'Cost', :with => 5
    fill_in 'Country of origin', :with => 'United States'
    click_button 'Create Product'
    click_link 'Cereal', match: :first
    click_link 'Add a review'
    fill_in 'Title', :with => ''
    click_button 'Create Review'
    # Tests for flash alert message
    expect(page).to have_content 'There was an error. Please try again.'
    # Tests for validation error message
    expect(page).to have_content 'Title can\'t be blank'
  end
end