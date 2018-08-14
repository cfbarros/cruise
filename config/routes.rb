Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # adding a root to our home page
  root to: 'bikes#index'
  resources :bikes do
    resources :rents, only: :new
  end
  resources :rents, except: :new
end
