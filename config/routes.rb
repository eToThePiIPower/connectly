Rails.application.routes.draw do
  unauthenticated do
    root 'static_pages#about'
  end
  authenticated :user do
    root 'contacts#index'
  end

  devise_for :users,
    controllers: { registrations: 'users/registrations' },
    path: '',
    path_names: {
      sign_in: 'signin',
      sign_out: 'signout',
      registration: 'register',
      sign_up: 'signup'
    }
  as :user do
    get '/signup', to: 'users/registrations#new', as: :user_signup
  end

  get '/about', to: 'static_pages#about'

  resources :contacts
end
