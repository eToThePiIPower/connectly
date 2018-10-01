require 'rails_helper'
require 'support/feature_helper'

RSpec.feature 'Users can create contacts', type: :feature do
  scenario 'User creats their first contact' do
    user = create(:user)
    login_as(user)

    visit '/contacts'
    click_link 'Add your first contact'
    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Street1', with: '123 Fake St'
    fill_in 'City', with: 'Springfield'
    fill_in 'State', with: 'NA'
    fill_in 'Zip', with: '99999'
    click_button 'Submit'

    expect(page).to have_css '.alert-info',
      text: 'Successfully added John Doe to your contacts'
    expect(page).to have_css '.card-header',
      text: 'John Doe'
  end

  scenario 'User sees a list of their existing contacts' do
    user = create(:user)
    login_as(user)

    create_list(:contact, 3, user: user)

    visit '/contacts'

    expect(page).to have_css '.card-header', count: 3
  end
end
