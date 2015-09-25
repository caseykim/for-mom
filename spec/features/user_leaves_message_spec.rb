require 'rails_helper'

feature 'User leaves a message', %(
  As a user
  I want to enter a message
  So that Sojin can read them
) do

  scenario 'user creates a message' do
    visit new_bday_message_path
    fill_in 'Name', with: "Kelly"
    fill_in 'Message', with: "banana"
    fill_in 'bday_message_password', with: "0000"
    click_button 'Submit 완료'

    expect(page).to have_content('Your message has been posted. Thank you!')
    expect(page).to have_content("banana")
    expect(page).to have_content("Kelly")
  end

  xscenario 'user edits a message' do

  end

  xscenario 'user deletes a message' do

  end

  xscenario 'user cannot change message without password' do

  end
end
