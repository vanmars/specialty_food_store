require 'rails_helper'

describe "the delete a review process" do
  it "deletes a review" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', with: 'peking duck'
    fill_in 'Cost', with: 5
    fill_in 'Country of origin', with: 'China'
    click_button 'Create Product'
    click_link 'Peking Duck', match: :first
    click_link 'Add a review'
    fill_in 'Title', with: 'brilliant'
    fill_in 'Author', with: 'Ima Sew Ungry'
    fill_in 'Content', with: 'I had no idea grocery stores sold Peking duck, or that it could actually good. I was delightfully wrong on both counts!'
    select 4, from: 'Rating'
    click_button 'Create Review'
    click_link 'brilliant'
    click_link 'Delete review'
     # Tests flash notice message
     expect(page).to have_content 'Review successfully deleted'
     # Tests that item was removed
     expect(page).to have_no_content 'brilliant'
  end
end