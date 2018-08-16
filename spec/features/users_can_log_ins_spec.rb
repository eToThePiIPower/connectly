require 'rails_helper'

RSpec.feature 'UsersCanLogIns', type: :feature do
  scenario 'User creats a new account' do
    visit '/users/sign_up'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Username', with: 'user01'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_text('You have signed up successfully')
  end

  scenario 'User logs in' do
    create :user, email: 'user@example.com', password: 'password'
    visit '/users/sign_in'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_text('Signed in successfully')
  end

  scenario 'User edits her account details' do
    user = create :user, username: 'User01', email: 'user@example.com', password: 'password'
    visit '/users/sign_in'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit '/users/edit'
    fill_in 'Email', with: 'user@domain.com'
    fill_in 'Username', with: 'NewUsername'
    fill_in 'Current password', with: 'password'
    click_button 'Update'

    user.reload
    expect(page).to have_text('Your account has been updated successfully')
    expect(user.email).to eq 'user@domain.com'
    expect(user.username).to eq 'NewUsername'
  end
end
