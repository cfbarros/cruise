Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # adding a root to our home page
  root to: 'bikes#index'
  resources :users, only: [:show, :edit, :update]
  resources :bikes do
    resources :rents, only: :create
  end
  resources :rents, except: :create
end
