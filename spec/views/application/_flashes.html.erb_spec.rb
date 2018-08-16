require 'rails_helper'

RSpec.describe 'application/_flashes', type: :view do
  context 'when there are alerts' do
    before(:each) do
      allow(view).to receive(:alert).and_return("Here's an alert")
    end

    it 'displays an alert flash' do
      render

      expect(rendered).to have_selector('.alert.alert-danger>strong',
        text: 'Alert')
      expect(rendered).to have_selector('.alert.alert-danger>p',
        text: "Here's an alert")
    end
  end

  context 'when there are notices' do
    before(:each) do
      allow(view).to receive(:notice).and_return("Here's a notice")
    end

    it 'displays a notice flash' do
      render

      expect(rendered).to have_selector('.alert.alert-info>strong',
        text: 'Notice')
      expect(rendered).to have_selector('.alert.alert-info>p',
        text: "Here's a notice")
    end
  end

  context 'when there are devise messages' do
    before(:each) do
      allow(view).to receive(:devise_error_messages?).and_return(true)
      allow(view).to receive(:devise_error_messages)
        .and_return(['Fix problem 1', 'Fix problem 2'])
    end

    it 'displays an alert flash' do
      render

      expect(rendered).to have_selector('.alert.alert-danger>strong',
        text: 'Errors were encountered with this resource')
      expect(rendered).to have_selector('.alert.alert-danger>ul>li',
        text: 'Fix problem 1')
      expect(rendered).to have_selector('.alert.alert-danger>ul>li',
        text: 'Fix problem 2')
    end
  end
end
