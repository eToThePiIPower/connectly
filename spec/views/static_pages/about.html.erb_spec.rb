require 'rails_helper'

RSpec.describe 'static_pages/about.html.erb', type: :view do
  it 'displays an about message' do
    render

    expect(rendered).to have_content 'About Us'
  end
end
