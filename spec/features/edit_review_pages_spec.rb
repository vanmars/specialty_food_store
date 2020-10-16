require 'rails_helper'

describe "the edit a review process" do
  it "edits a review" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', with: 'peking duck'
    fill_in 'Cost', with: 5
    fill_in 'Country of origin', with: 'China'
    click_on 'Create Product'
    click_link 'Peking Duck', match: :first
    click_link 'Add a review'
    fill_in 'Title', with: 'brilliant'
    fill_in 'Author', with: 'Ima Sew Ungry'
    fill_in 'Content', with: 'I had no idea grocery stores sold Peking duck, or that it could actually good. I was delightfully wrong on both counts!'
    select 4, from: 'Rating'
    click_link 'brilliant'
    click_link 'Edit review'
    select 5, from: 'Rating'
    click_button 'Update Review'
    # Tests flash notice message
    expect(page).to have_content 'Review successfully updated'
  end

  it "gives an error when no author is entered" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'peking duck'
    fill_in 'Cost', :with => 5
    fill_in 'Country of origin', :with => 'China'
    click_link 'Create Product'
    click_link 'Peking Duck', match: :first
    click_link 'Add a review'
    fill_in 'Title', :with => 'brillian'
    fill_in 'Author', :with => 'Ima Sew Ungry'
    fill_in 'Content', :with => 'I had no idea grocery stores sold Peking duck, or that it could actually good. I was delightfully wrong on both counts!'
    select 4, from: 'Rating'
    click_on 'brilliant'
    click_link 'Edit review'
    fill_in 'Author', :with => ''
    click_button 'Update Review'
    # Tests for flash alert message
    expect(page).to have_content 'There was an error. Please try again.'
    # Tests for validation error message
    expect(page).to have_content 'Author can\'t be blank'
  end
end