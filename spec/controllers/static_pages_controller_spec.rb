require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #about' do
    before(:each) do
      get :about
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
