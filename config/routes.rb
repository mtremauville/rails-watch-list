Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # get "movies", to: "movies#index"
  # get "movies/new", to: "movies#new"
  # get "movies/:id", to: "movies#show", as: :movie
  # post "movies", to: "movies#create"
  # get "movies/:id/edit", to: "movies#edit"
  # patch "movies/:id", to: "movies#update"
  # delete "movies/:id", to: "movies#destroy"
  root "lists#index"
  resources :lists, only: [ :index, :new, :create, :show, :destroy ] do
    resources :bookmarks, only: [ :new, :create ]
  end
  resources :bookmarks, only: [ :destroy ]
end
