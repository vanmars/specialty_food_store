require 'rails_helper'

describe "links to move between products and product pages" do
  it "navigates to new product page" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'cereal'
    fill_in 'Cost', :with => 5
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    click_on 'Cereal', match: :first
    # Tests detail page has proper content
    expect(page).to have_content 'Country of Origin'
    expect(page).to have_content 'Cost'
  end

  it "returns user to home page" do
    visit new_product_path
    fill_in 'Name', :with => 'cereal'
    fill_in 'Cost', :with => 5
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    click_on 'Cereal', match: :first
    click_on 'Return to products'
    # Tests products page has proper content
    expect(page).to have_content 'About Us'
    expect(page).to have_content 'Newly Added Products'
    expect(page).to have_content 'Most Reviewed Product'
    expect(page).to have_content 'Product List'
  end
end