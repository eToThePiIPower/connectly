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
    fill_in 'Description',
      with: 'This is my account. There are many like it but this one is mine.'
    fill_in 'Current password', with: 'password'
    click_button 'Update'

    user.reload
    expect(page).to have_text('Your account has been updated successfully')
    expect(user.profile.description).to \
      eq 'This is my account. There are many like it but this one is mine.'
  end

  scenario 'User uploads an avatar' do
    user = create :user,
      username: 'User01',
      email: 'user@example.com'
    visit '/users/sign_in'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit '/users/edit'

    attach_file 'user[profile_attributes][avatar]', Rails.root.join('spec', 'fixtures', 'test.png')
    fill_in 'Current password', with: 'password'
    click_button 'Update'

    user.reload
    expect(page).to have_css("img[src*='test.png']")
    expect(user.profile.avatar.blob.filename).to eq 'test.png'
    expect(user.profile.avatar.blob.content_type).to eq 'image/png'
  end
end
