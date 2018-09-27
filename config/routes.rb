Rails.application.routes.draw do
  authenticated :user do
    root 'contacts#index'
  end
  root 'static_pages#about'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  get '/about', to: 'static_pages#about'

  resources :contacts
end
