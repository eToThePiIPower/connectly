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
    click_button 'Submit'

    expect(page).to have_css '.alert-info',
      text: 'Successfully added John Doe to your contacts'
    expect(page).to have_css '.card-title',
      text: 'John Doe'
  end
end
