Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resource :root, only: [:index]

  resources :hamming_distance_calculation, only: [:new] do
    collection do
      post :calculate
    end
  end
  

  root "root#index"
end
