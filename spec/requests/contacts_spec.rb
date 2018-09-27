require 'rails_helper'
require 'support/feature_helper'

RSpec.describe 'Contacts', type: :request do
  describe 'GET /contacts' do
    it 'works! (now write some real specs)' do
      login_as(create(:user))
      get contacts_path
      expect(response).to have_http_status(200)
    end
  end
end
