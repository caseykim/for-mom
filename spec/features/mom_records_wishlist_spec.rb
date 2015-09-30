require 'rails_helper'

feature 'Mom records wishlist', %(
  As a birthday mom
  I want to record a gift to wishlist
  So that I hope Casey gets me the gift

  Acceptance Criteria
  [ ] I must be able to get to wishlist new form from index page
  [ ] I must enter amount within $500 range
  [ ] I must be presented with error if the price is above $500
  [ ] I must provide name and price
  [ ] I can optionally provide description
  [ ] I must be redirected to index page to review the item I added
) do
  scenario 'mom posts a gift on wishlist' do
    visit gifts_path
    click_on 'Add to wishlist'
    fill_in 'Name', with: "Something"
    fill_in 'gift_price', with: "499.00"
    click_on 'Add'

    expect(page).to have_content("Successfully added a gift on wishlist")
    expect(page).to have_content("Something")
    expect(page).to have_content("499.00")
  end

  scenario 'mom posts a gift that is worth more than $500' do
    visit new_gift_path
    fill_in 'Name', with: "expensive"
    fill_in 'gift_price', with: "500.01"
    click_on 'Add'

    expect(page).to have_content("Item not within Casey's budget :(")
  end
end
