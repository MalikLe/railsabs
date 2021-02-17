Rails.application.routes.draw do
  resources :weeks
  devise_for :users
  resources :students
  get 'home/about'

  # Set index as homepage
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
