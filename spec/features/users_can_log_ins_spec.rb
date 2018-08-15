require 'rails_helper'

RSpec.feature 'UsersCanLogIns', type: :feature do
  scenario 'User creats a new account' do
    visit '/users/sign_up'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_text('You have signed up successfully')
  end
end
