Rails.application.routes.draw do
  devise_for :users
  root to: 'bikes#index'
  resources :bikes do
    resources :rents, only: :new
  end
  resources :rents
end
