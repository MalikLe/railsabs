Rails.application.routes.draw do

  resources :scores do
    collection do
      put :discontinue
    end
  end

  resources :tests do
    collection do
      put :discontinue
    end
  end
  resources :subjects
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
  get 'home/resulttable'
  get 'home/new_test'
  get 'home/edit_results'
  get 'home/show_results'
  get 'home/construction'
  get 'home/login_students'
  get 'home/index_teachers'
end
