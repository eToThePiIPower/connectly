require 'rails_helper'

RSpec.describe 'contacts/show', type: :view do
  before(:each) do
    @contact = assign(:contact, create(:contact,
      name: 'Name', email: 'Email', notes: 'My Notes'))
  end

  it 'renders attributes in a card' do
    render
    expect(rendered).to have_selector '.card>.card-header',
      text: 'Name'
    expect(rendered).to have_selector '.card>.card-body',
      text: 'Email'
    expect(rendered).to have_selector '.card>.card-body',
      text: 'My Notes'
  end
end
