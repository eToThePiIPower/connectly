require 'rails_helper'

RSpec.describe 'contacts/edit', type: :view do
  before(:each) do
    @contact = assign(:contact, create(:contact,
      name: 'Name', email: 'Email', notes: 'My Notes'))
  end

  it 'renders the edit contact form' do
    render

    expect(rendered).to have_selector \
      "form[action='#{contact_path(@contact)}'][method=post]"
    expect(rendered).to have_selector \
      "form[action='#{contact_path(@contact)}'][method=post] input[name='contact[name]']"
    expect(rendered).to have_selector \
      "form[action='#{contact_path(@contact)}'][method=post] input[name='contact[email]']"
    expect(rendered).to have_selector \
      "form[action='#{contact_path(@contact)}'][method=post] textarea[name='contact[notes]']"
  end
end
