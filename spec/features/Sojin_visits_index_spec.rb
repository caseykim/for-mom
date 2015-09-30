require 'rails_helper'

feature 'Sojin vists index page', %(
  As a birthday mom
  I want to see pictures of my family
  So that I can remember the good times spent with them
) do
  scenario 'Sojin sees pictures on home#index' do
    visit root_path
    expect(page).to have_content()
  end
end
