Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#about'
  get '/about', to: 'static_pages#about'
end
