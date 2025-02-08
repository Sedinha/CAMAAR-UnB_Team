Rails.application.routes.draw do
  root "home#index"

  resources :users
  # Rotas para criacao de usuario
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  post "/login", to: "home#create"

  # Rotas de Login
  # get "/admin_login", to: "home#admin_login"
  # get "/user_login", to: "home#user_login"
  # post "/login", to: "sessions#create"
  #
  # Rotas de Logout
  delete "/logout", to: "sessions#destroy"

  resources :templates
  resources :questionarios, only: [ :new, :create, :index, :show ]
  get "questionarios/results/:id", to: "questionarios#results", as: :questionario_results
  resources :respostas, only: [ :create ]

  get "admin/management", to: "admin#management"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
