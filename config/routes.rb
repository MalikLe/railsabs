Rails.application.routes.draw do

  resources :periods do
    collection do
      put :discontinue
    end
  end

  resources :weeks
  devise_for :users
  resources :students
  resources :groups
  get 'home/about'

  # Set index as homepage
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Custom root
  get 'home/select'
  get 'home/timetable'
end
