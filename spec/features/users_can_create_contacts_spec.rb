require 'rails_helper'
require 'support/feature_helper'
require 'support/javascript'

RSpec.feature 'Users can create contacts', type: :feature do
  scenario 'User creats their first contact' do
    user = create(:user)
    login_as(user)

    visit '/contacts'
    click_link 'Add your first contact'
    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Street Address', with: '123 Fake St'
    fill_in 'City', with: 'Springfield'
    fill_in 'State', with: 'NA'
    fill_in 'Zip', with: '99999'
    click_button 'Submit'

    expect(page).to have_css '.alert-info',
      text: 'Successfully added John Doe to your contacts'
    expect(page).to have_css '.card-header',
      text: 'John Doe'
  end

  scenario 'User addes an address to an existing contact', js: true do
    user = create(:user)
    contact = create(:contact_with_addresses, user: user, addresses_count: 2)
    login_as(user)

    visit edit_contact_path(contact)
    expect(page).to have_css 'label',
      text: 'Street Address',
      count: 2, wait: 5

    click_link 'Add Address'
    within('#contact_addresses_attributes_0') do
      fill_in 'Street Address', with: '123 Fake St'
    end
    within('#contact_addresses_attributes_1') do
      fill_in 'Street Address', with: '1234 Faker St'
    end
    within('#contact_addresses_attributes_2') do
      fill_in 'Street Address', with: '12345 Fakest St'
    end
    click_button 'Submit'

    expect(contact.addresses.count).to eq 3
    expect(page).to have_css 'p', text: '123 Fake St'
    expect(page).to have_css 'p', text: '1234 Faker St'
    expect(page).to have_css 'p', text: '12345 Fakest St'
  end

  scenario 'User sees a list of their existing contacts' do
    user = create(:user)
    login_as(user)

    create_list(:contact, 3, user: user)

    visit '/contacts'

    expect(page).to have_css '.card-header', count: 3
  end
end
