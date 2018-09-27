require 'rails_helper'

RSpec.describe 'contacts/new', type: :view do
  before(:each) do
    assign(:contact, build(:contact))
  end

  it 'renders new contact form' do
    render

    expect(rendered).to have_selector \
      "form[action='#{contacts_path}'][method=post]"
    expect(rendered).to have_selector \
      "form[action='#{contacts_path}'][method=post] input[name='contact[name]']"
    expect(rendered).to have_selector \
      "form[action='#{contacts_path}'][method=post] input[name='contact[email]']"
    expect(rendered).to have_selector \
      "form[action='#{contacts_path}'][method=post] textarea[name='contact[notes]']"
  end
end
