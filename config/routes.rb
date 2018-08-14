Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  # added the basic root
  root to: 'bikes#index'
  # creates the routes we need for bikes and the nested rents routes i believe were needed
  resources :bikes do
    resources :rents, only: :new
  end
  # creates some of the other rents routes we might need but need to verify
  resources :rents
end
