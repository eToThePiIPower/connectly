require 'rails_helper'

RSpec.describe 'contacts/index', type: :view do
  context 'when the user has no contacts' do
    before(:each) do
      assign(:contacts, [])
    end

    it 'renders a button to add the first contact' do
      render
      expect(rendered).to have_selector '.btn-primary',
        text: 'Add your first contact'
      expect(rendered).not_to have_selector('.card-column')
    end
  end

  context 'when the user has contacts' do
    before(:each) do
      assign(:contacts, create_list(:contact, 2,
        name: 'Name', email: 'Email', notes: 'My Notes'))
    end

    it 'renders a list of contacts' do
      render
      expect(rendered).to have_selector '.card>.card-header',
        text: 'Name',
        count: 2
      expect(rendered).to have_selector '.card>.card-body',
        text: 'Email',
        count: 2
      expect(rendered).to have_selector '.card>.card-body',
        text: 'My Notes',
        count: 2
      expect(rendered).not_to have_selector '.btn-primary',
        text: 'Add your first contact'
    end
  end
end
