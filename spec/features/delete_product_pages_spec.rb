require 'rails_helper'

describe "the delete a product process" do
  it "deletes a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'peking duck'
    fill_in 'Cost', :with => 5
    fill_in 'Country of origin', :with => 'China'
    click_on 'Submit'
    click_link 'Peking Duck', match: :first
    click_link 'Delete Product'
    # Tests flash notice message
    expect(page).to have_content 'Product successfully deleted'
    # Tests that item was removed
    expect(page).to have_no_content 'Peking Duck'
  end
end