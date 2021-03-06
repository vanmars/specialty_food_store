require 'rails_helper'

describe "the edit a product process" do
  it "edits a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'peking duck'
    fill_in 'Cost', :with => 5
    fill_in 'Country of origin', :with => 'China'
    click_on 'Submit'
    click_link 'Peking Duck', match: :first
    click_link 'Edit Product'
    fill_in 'Country of origin', :with => 'Bhutan'
    click_on 'Submit'
    # Tests flash notice message
    expect(page).to have_content 'Product successfully updated'
  end

  it "gives an error when no cost is entered" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'peking duck'
    fill_in 'Cost', :with => 5
    fill_in 'Country of origin', :with => 'China'
    click_on 'Submit'
    click_link 'Peking Duck', match: :first
    click_link 'Edit Product'
    fill_in 'Cost', :with => ''
    click_on 'Submit'
    # Tests for flash alert message
    expect(page).to have_content 'There was an error. Please try again.'
    # Tests for validation error message
    expect(page).to have_content 'Cost can\'t be blank'
  end
end