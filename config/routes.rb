Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :restaurants do
    #additional routs that relate to restaurants go here:

    resources :reviews, only: [:new, :create]
      collection do
        #/restaurants/whatever_word_you_say
        get :top
      end

      member do
        #/restaurants/:id/whatever_word_you_say
        get :chef

      end
  end

  resources :reviews, only: [:destroy]
end

  # get "restaurants/top", to: "restaurants#top"
  # get "restaurants/:id/chef", to: "restaurants#chef"
