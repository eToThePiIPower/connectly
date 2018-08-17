require 'rails_helper'

RSpec.feature 'UsersHaveProfiles', type: :feature do
  scenario 'User edits their profile' do
    user = create :user,
      username: 'User01',
      email: 'user@example.com'
    visit '/users/sign_in'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit '/users/edit'
    # fill_in 'Description',
    #   with: 'This is my account. There are many like it but this one is mine.'
    fill_in 'Current password', with: 'password'
    click_button 'Update'

    user.reload
    expect(page).to have_text('Your account has been updated successfully')
    expect(user.profile.description).to \
      eq 'This is my account. There are many like it but this one is mine.'
  end
end
