Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :flats do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: :update do
    member do
      patch "accept"
      patch "deny"
    end
  end



  get 'profile', to: 'users#profile', as: :profile
end
