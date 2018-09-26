Rails.application.routes.draw do
  resources :contacts
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'static_pages#about'
  get '/about', to: 'static_pages#about'
end
