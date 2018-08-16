require 'rails_helper'

RSpec.describe 'application/_navbar', type: :view do
  context 'a user is logged in' do
    before(:each) do
      user = build(:user, username: 'Username01')
      allow(view).to receive(:user_signed_in?).and_return(true)
      allow(view).to receive(:current_user).and_return(user)
    end

    it 'renders a user dropdown' do
      render

      expect(rendered).to have_selector('.dropdown>a.dropdown-toggle',
        text: 'Username01')
      expect(rendered).to have_selector('.dropdown>.dropdown-menu>.dropdown-item',
        text: 'Logout')
      expect(rendered).to have_selector('.dropdown>.dropdown-menu>.dropdown-item',
        text: 'Edit Account')
      expect(rendered).not_to have_selector('.btn.btn-primary',
        text: 'Sign up')
      expect(rendered).not_to have_selector('.btn.btn-outline-light',
        text: 'Sign in')
    end
  end

  context 'a user is not logged in' do
    before(:each) do
      allow(view).to receive(:user_signed_in?).and_return(false)
    end

    it 'renders sign_in and sign_up buttons' do
      render

      expect(rendered).to have_selector('.btn.btn-primary',
        text: 'Sign up')
      expect(rendered).to have_selector('.btn.btn-outline-light',
        text: 'Sign in')
      expect(rendered).not_to have_selector('.dropdown>a.dropdown-toggle',
        text: 'Username01')
    end
  end
end
