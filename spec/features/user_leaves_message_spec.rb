require 'rails_helper'

feature 'User leaves a message', %(
  As a user
  I want to enter a message
  So that Sojin can read them
) do

  before do
    FactoryGirl.create(:bday_message)
  end
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

  scenario 'user edits a message' do
    visit bday_messages_path
    click_button 'Edit (수정)'
    within('.editform') do
      fill_in 'Name', with: "Kind Alum"
      fill_in 'bday_message_password', with: "0000"
      click_button 'Edit 수정'
    end

    expect(page).to have_content('Message updated.')
    expect(page).to have_content('Kind Alum')
  end

  scenario 'user deletes a message' do
    visit bday_messages_path
    expect(page).to have_css('fieldset.content', count: 1)

    click_button 'Delete (삭제)'
    within('.deleteform') do
      fill_in 'bday_message_password', with: "0000"
      click_button 'Delete 삭제'
    end

    expect(page).to have_content('Message deleted.')
    expect(page).to have_css('fieldset.content', count: 0)
  end

  scenario 'user cannot change message without password' do
    visit bday_messages_path
    click_button 'Edit (수정)'
    within('.editform') do
      fill_in 'Name', with: "Bad Alum"
      click_button 'Edit 수정'
    end

    expect(page).to have_content('Wrong password.')
  end
end
