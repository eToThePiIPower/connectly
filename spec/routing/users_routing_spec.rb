require 'rails_helper'

RSpec.describe 'User', type: :routing do
  describe 'routing' do
    #
    # Sessions
    #
    it 'routes to sessions#new' do
      expect(get: '/signin').to route_to('devise/sessions#new')
    end

    it 'routes to sessions#create' do
      expect(post: '/signin').to route_to('devise/sessions#create')
    end

    it 'routes to sessions#destroy' do
      expect(delete: '/signout').to route_to('devise/sessions#destroy')
    end

    #
    # Passwords
    #
    it 'routes to passwords#new' do
      expect(get: '/password/new').to route_to('devise/passwords#new')
    end

    it 'routes to passwords#create' do
      expect(post: '/password').to route_to('devise/passwords#create')
    end

    it 'routes to passwords#edit' do
      expect(get: '/password/edit').to route_to('devise/passwords#edit')
    end

    it 'routes to passwords#update' do
      expect(put: '/password').to route_to('devise/passwords#update')
    end

    it 'routes to passwords#update' do
      expect(patch: '/password').to route_to('devise/passwords#update')
    end

    #
    # Registrations
    #
    it 'routes to registrations#new' do
      expect(get: '/register/signup').to route_to('users/registrations#new')
    end

    it 'routes to registrations#new' do
      expect(get: '/signup').to route_to('users/registrations#new')
    end

    it 'routes to registrations#new' do
      expect(get: '/signup').to route_to('users/registrations#new')
    end

    it 'routes to registrations#create' do
      expect(post: '/register').to route_to('users/registrations#create')
    end

    it 'routes to registrations#cancel' do
      expect(get: '/register/cancel').to route_to('users/registrations#cancel')
    end

    it 'routes to registrations#edit' do
      expect(get: '/register/edit').to route_to('users/registrations#edit')
    end

    it 'routes to registrations#update' do
      expect(put: '/register').to route_to('users/registrations#update')
    end

    it 'routes to registrations#update' do
      expect(patch: '/register').to route_to('users/registrations#update')
    end

    it 'routes to registrations#destroy' do
      expect(delete: '/register').to route_to('users/registrations#destroy')
    end
  end
end
